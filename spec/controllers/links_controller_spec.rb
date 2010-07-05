require 'spec_helper'

describe LinksController do

  def mock_link(stubs={})
    @mock_link ||= mock_model(Link, stubs).as_null_object
  end

  describe "GET show" do
    it "assigns the requested link as @link" do
      Link.stub(:find).with("37") { mock_link }
      get :show, :id => "37"
      assigns(:link).should be(mock_link)
    end
  end

  describe "GET new" do
    it "assigns a new link as @link" do
      Link.stub(:new) { mock_link }
      get :new
      assigns(:link).should be(mock_link)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created link as @link" do
        Link.stub(:new).with({'these' => 'params'}) { mock_link(:save => true) }
        post :create, :link => {'these' => 'params'}
        assigns(:link).should be(mock_link)
      end

      it "redirects to the created link" do
        Link.stub(:new) { mock_link(:save => true) }
        post :create, :link => {}
        response.should redirect_to(link_url(mock_link))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved link as @link" do
        Link.stub(:new).with({'these' => 'params'}) { mock_link(:save => false) }
        post :create, :link => {'these' => 'params'}
        assigns(:link).should be(mock_link)
      end

      it "re-renders the 'new' template" do
        Link.stub(:new) { mock_link(:save => false) }
        post :create, :link => {}
        response.should render_template("new")
      end
    end

  end

end
