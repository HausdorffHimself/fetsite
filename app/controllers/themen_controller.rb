class ThemenController < ApplicationController
  # GET /themen
  # GET /themen.json
  load_and_authorize_resource

  def index
    @themen = Thema.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @themen }
    end
  end

  # GET /themen/1
  # GET /themen/1.json
  def show
    @thema = Thema.find(params[:id])
    redirect_to :controller=>'themengruppen', :id=>@thema.themengruppe.id, :action=>:show, :anchor=> "thema_"+params[:id].to_s
    @fragen=@thema.fragen
    @toolbar_elements = [{:icon=>:pencil, :hicon=>'icon-pencil', :text=>"Verwalten", :path=>verwalten_thema_path(@thema)}]

    @toolbar_elements = [{:icon=>:pencil, :hicon=>'icon-pencil', :text=>I18n.t('thema.edit'), :path=>edit_thema_path(@thema)}]
    @toolbar_elements << {:hicon=>'icon-remove-circle', :text=>I18n.t('thema.remove'), :path=>thema_path(@thema), :method=>:delete, :confirm=>I18n.t('thema.sure')}

  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @thema }
  #  end
  end
  def verwalten
    @thema = Thema.find(params[:id])
    @fragen=@thema.fragen
    @toolbar_elements = [{:icon=>:pencil, :hicon=>'icon-pencil', :text=>"Verwalten", :path=>verwalten_thema_path(@thema)}]

    @toolbar_elements = [{:icon=>:pencil, :hicon=>'icon-pencil', :text=>I18n.t('thema.edit'), :path=>edit_thema_path(@thema)}]
    @toolbar_elements << {:hicon=>'icon-remove-circle', :text=>I18n.t('thema.remove'), :path=>thema_path(@thema), :method=>:delete, :confirm=>I18n.t('thema.sure')}
    
  end
  # GET /themen/new
  # GET /themen/new.json
  def new
    @thema = Thema.new
    @thema.themengruppe = Themengruppe.find(params[:themengruppe_id]) unless params[:themengruppe_id].nil?
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thema }
      format.js { render action: "edit" }
    end
  end

  # GET /themen/1/edit
  def edit
    @thema = Thema.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /themen
  # POST /themen.json
  def create
    @thema = Thema.new(params[:thema])
   
      @themen = @thema.themengruppe.themen.order(:priority).reverse
    respond_to do |format|
      if @thema.save
        format.html { redirect_to @thema, notice: 'Thema was successfully created.' }
        format.json { render json: @thema, status: :created, location: @thema }
        format.js   {render action: "update"}
      else
        format.html { render action: "new" }
        format.json { render json: @thema.errors, status: :unprocessable_entity }
      format.js   { render action: "edit" }
      end
    end
  end
 def fragen
    @thema = Thema.find(params[:id])
    @fragen=@thema.fragen
    respond_to do |format|
      format.js
    end
  end
  # PUT /themen/1
  # PUT /themen/1.json
  def update
    @thema = Thema.find(params[:id])
  @themen = @thema.themengruppe.themen.order(:priority).reverse
    respond_to do |format|
      if @thema.update_attributes(params[:thema])
        format.html { redirect_to @thema, notice: 'Thema was successfully updated.' }
        format.json { head :no_content }
        format.js   
      else
        format.html { render action: "edit" }
        format.json { render json: @thema.errors, status: :unprocessable_entity }
        format.js   { render action: "edit" }
      end
    end
  end

  # DELETE /themen/1
  # DELETE /themen/1.json
  def destroy
    @thema = Thema.find(params[:id])
    @thema.destroy

    respond_to do |format|
      format.html { redirect_to themengruppe_path(@thema.themengruppe) }
      format.json { head :no_content }
    end
  end
end
