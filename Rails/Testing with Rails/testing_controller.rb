# (http request) :(controller action), (params)

Rspec.describe DemoController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
end

# spec/controllers/capy_controller.rb

require 'rails_helper'

Rspec.describe CapysController, type: :controller do
  describe "GET #index" do
    it "renders the capy's index" do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      Capy.create!(name: "Deb", color: "blue")
      get :show, id: 1
      expect(response).to render_template(:show)
    end

    context "if the cappybarra does not exist" do
      it "is not a success" do
        begin
          get :show, id:-1
        rescue
          ActiveRecord::RecordNotFound
        end
        expect(response).not_to render_template(:show)
      end
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "renders the new template" do
        post :create, capy: {name: "Kath" }
        expect(response).to render_template(:new)
      end
    end
    context "with valid params" do
      it "redirects to capy page on success" do
        post :create, capy: {name: "Kath", color: "maroon"}
        expect(response).to redirect_to(capy_url(Capy.find_by({name: "Kath"})))
      end
    end
  end
end