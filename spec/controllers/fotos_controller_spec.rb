require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FotosController do

  # This should return the minimal set of attributes required to create a valid
  # Foto. As you add validations to Foto, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FotosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all fotos as @fotos" do
      foto = Foto.create! valid_attributes
      get :index, {}, valid_session
      assigns(:fotos).should eq([foto])
    end
  end

  describe "GET show" do
    it "assigns the requested foto as @foto" do
      foto = Foto.create! valid_attributes
      get :show, {:id => foto.to_param}, valid_session
      assigns(:foto).should eq(foto)
    end
  end

  describe "GET new" do
    it "assigns a new foto as @foto" do
      get :new, {}, valid_session
      assigns(:foto).should be_a_new(Foto)
    end
  end

  describe "GET edit" do
    it "assigns the requested foto as @foto" do
      foto = Foto.create! valid_attributes
      get :edit, {:id => foto.to_param}, valid_session
      assigns(:foto).should eq(foto)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Foto" do
        expect {
          post :create, {:foto => valid_attributes}, valid_session
        }.to change(Foto, :count).by(1)
      end

      it "assigns a newly created foto as @foto" do
        post :create, {:foto => valid_attributes}, valid_session
        assigns(:foto).should be_a(Foto)
        assigns(:foto).should be_persisted
      end

      it "redirects to the created foto" do
        post :create, {:foto => valid_attributes}, valid_session
        response.should redirect_to(Foto.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved foto as @foto" do
        # Trigger the behavior that occurs when invalid params are submitted
        Foto.any_instance.stub(:save).and_return(false)
        post :create, {:foto => { "title" => "invalid value" }}, valid_session
        assigns(:foto).should be_a_new(Foto)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Foto.any_instance.stub(:save).and_return(false)
        post :create, {:foto => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested foto" do
        foto = Foto.create! valid_attributes
        # Assuming there are no other fotos in the database, this
        # specifies that the Foto created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Foto.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => foto.to_param, :foto => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested foto as @foto" do
        foto = Foto.create! valid_attributes
        put :update, {:id => foto.to_param, :foto => valid_attributes}, valid_session
        assigns(:foto).should eq(foto)
      end

      it "redirects to the foto" do
        foto = Foto.create! valid_attributes
        put :update, {:id => foto.to_param, :foto => valid_attributes}, valid_session
        response.should redirect_to(foto)
      end
    end

    describe "with invalid params" do
      it "assigns the foto as @foto" do
        foto = Foto.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Foto.any_instance.stub(:save).and_return(false)
        put :update, {:id => foto.to_param, :foto => { "title" => "invalid value" }}, valid_session
        assigns(:foto).should eq(foto)
      end

      it "re-renders the 'edit' template" do
        foto = Foto.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Foto.any_instance.stub(:save).and_return(false)
        put :update, {:id => foto.to_param, :foto => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested foto" do
      foto = Foto.create! valid_attributes
      expect {
        delete :destroy, {:id => foto.to_param}, valid_session
      }.to change(Foto, :count).by(-1)
    end

    it "redirects to the fotos list" do
      foto = Foto.create! valid_attributes
      delete :destroy, {:id => foto.to_param}, valid_session
      response.should redirect_to(fotos_url)
    end
  end

end
