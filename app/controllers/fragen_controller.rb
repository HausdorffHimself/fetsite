
class FragenController < ApplicationController
  # GET /fragen
  # GET /fragen.json
  load_and_authorize_resource
  def index
    @fragen = Frage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fragen }
    end
  end

  # GET /fragen/1
  # GET /fragen/1.json
  def show
    @frage = Frage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @frage }
    end
  end

  # GET /fragen/new
  # GET /fragen/new.json
  def new
    @frage = Frage.new

    respond_to do |format|
      format.html
      format.json { render json: @frage }
      format.js
    end
  end
 
  # GET /fragen/1/edit
  def edit
    @frage = Frage.find(params[:id])
    respond_to do |format|
      format.html
      format.js {render action: :new}
    end 
  end

  # POST /fragen
  # POST /fragen.json
  def create
    @frage = Frage.new(params[:frage])
    thema=@frage.thema
    @fragen=@frage.thema.fragen
    respond_to do |format|
      if @frage.save
        format.html { redirect_to @frage.thema, notice: 'Frage was successfully created.' }
        format.json { render json: @frage, status: :created, location: @frage }
        format.js {@frage=Frage.new ; @frage.thema=thema}
      else
        format.html { render action: "new" }
        format.json { render json: @frage.errors, status: :unprocessable_entity }
        format.js 
      end
    end
  end

  # PUT /fragen/1
  # PUT /fragen/1.json
  def update
    @frage = Frage.find(params[:id])

    respond_to do |format|
      if @frage.update_attributes(params[:frage])
        format.html { redirect_to @frage, notice: 'Frage was successfully updated.' }
        format.json { head :no_content }
        format.js {@frage=Frage.new; render action: "new"}
      else
        format.html { render action: "edit" }
        format.json { render json: @frage.errors, status: :unprocessable_entity }
        format.js {render action: "edit"}
      end
    end
  end

  # DELETE /fragen/1
  # DELETE /fragen/1.json
  def destroy
    @frage = Frage.find(params[:id])
    @thema=@frage.thema
    @frage.destroy

    respond_to do |format|
      format.html { redirect_to @frage.thema }
      format.json { head :no_content }
      format.js { 
        @fragen=@thema.fragen
        render :create
      }
    end
  end
end
