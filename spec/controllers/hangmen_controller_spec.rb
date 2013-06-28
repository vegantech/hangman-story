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

describe HangmenController do

  # This should return the minimal set of attributes required to create a valid
  # Hangman. As you add validations to Hangman, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "solution" => "MyText" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HangmenController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all hangmen as @hangmen" do
      hangman = Hangman.create! valid_attributes
      get :index, {}, valid_session
      assigns(:hangmen).should eq([hangman])
    end
  end

  describe "GET show" do
    it "assigns the requested hangman as @hangman" do
      hangman = Hangman.create! valid_attributes
      get :show, {:id => hangman.to_param}, valid_session
      assigns(:hangman).should eq(hangman)
    end
  end

  describe "GET new" do
    it "assigns a new hangman as @hangman" do
      get :new, {}, valid_session
      assigns(:hangman).should be_a_new(Hangman)
    end
  end

  describe "GET edit" do
    it "assigns the requested hangman as @hangman" do
      hangman = Hangman.create! valid_attributes
      get :edit, {:id => hangman.to_param}, valid_session
      assigns(:hangman).should eq(hangman)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Hangman" do
        expect {
          post :create, {:hangman => valid_attributes}, valid_session
        }.to change(Hangman, :count).by(1)
      end

      it "assigns a newly created hangman as @hangman" do
        post :create, {:hangman => valid_attributes}, valid_session
        assigns(:hangman).should be_a(Hangman)
        assigns(:hangman).should be_persisted
      end

      it "redirects to the created hangman" do
        post :create, {:hangman => valid_attributes}, valid_session
        response.should redirect_to(Hangman.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved hangman as @hangman" do
        # Trigger the behavior that occurs when invalid params are submitted
        Hangman.any_instance.stub(:save).and_return(false)
        post :create, {:hangman => { "solution" => "invalid value" }}, valid_session
        assigns(:hangman).should be_a_new(Hangman)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Hangman.any_instance.stub(:save).and_return(false)
        post :create, {:hangman => { "solution" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested hangman" do
        hangman = Hangman.create! valid_attributes
        # Assuming there are no other hangmen in the database, this
        # specifies that the Hangman created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Hangman.any_instance.should_receive(:update).with({ "solution" => "MyText" })
        put :update, {:id => hangman.to_param, :hangman => { "solution" => "MyText" }}, valid_session
      end

      it "assigns the requested hangman as @hangman" do
        hangman = Hangman.create! valid_attributes
        put :update, {:id => hangman.to_param, :hangman => valid_attributes}, valid_session
        assigns(:hangman).should eq(hangman)
      end

      it "redirects to the hangman" do
        hangman = Hangman.create! valid_attributes
        put :update, {:id => hangman.to_param, :hangman => valid_attributes}, valid_session
        response.should redirect_to(hangman)
      end
    end

    describe "with invalid params" do
      it "assigns the hangman as @hangman" do
        hangman = Hangman.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Hangman.any_instance.stub(:save).and_return(false)
        put :update, {:id => hangman.to_param, :hangman => { "solution" => "invalid value" }}, valid_session
        assigns(:hangman).should eq(hangman)
      end

      it "re-renders the 'edit' template" do
        hangman = Hangman.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Hangman.any_instance.stub(:save).and_return(false)
        put :update, {:id => hangman.to_param, :hangman => { "solution" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested hangman" do
      hangman = Hangman.create! valid_attributes
      expect {
        delete :destroy, {:id => hangman.to_param}, valid_session
      }.to change(Hangman, :count).by(-1)
    end

    it "redirects to the hangmen list" do
      hangman = Hangman.create! valid_attributes
      delete :destroy, {:id => hangman.to_param}, valid_session
      response.should redirect_to(hangmen_url)
    end
  end

end