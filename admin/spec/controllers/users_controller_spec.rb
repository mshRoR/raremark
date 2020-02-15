require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET index" do
    let(:user) { FactoryBot.create :user }
    it "users list" do
      get :index
      expect(assigns(:users)).to eq([user])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do
    it "renders the #new view" do
      get :new
      response.should render_template :new
    end
  end


  describe "POST create" do
    context "with valid attributes" do
      let(:country) { FactoryBot.create :country }
      let(:disease) { FactoryBot.create :disease }

      let(:params) {{
          name: Faker::Name.name,
          email: Faker::Internet.email,
          profile_attributes: {
              gender: "Male",
              born_year: "1997",
              born_month: 11,
              profile_type: 'Patient',
              country_id: country.id
          },
          disease_histories_attributes: [{
             disease_id: disease.id
          }]
      }}

      it "creates a new user" do
        expect {post :create, params: { user: params }}.to change(User, :count).by(1)
      end

    end


    context "with invalid attributes" do
      let(:country) { FactoryBot.create :country }
      let(:disease) { FactoryBot.create :disease }

      let(:params) {{
          email: Faker::Internet.email,
          profile_attributes: {
              born_month: 11,
              profile_type: 'Patient',
              country_id: country.id
          },
          disease_histories_attributes: [{
             disease_id: disease.id
             }]
      }}

      it "creates a new user" do
        expect {post :create, params: { user: params }}.to change(User, :count).by(0)
      end

    end

  end


  describe "GET #show" do
    let(:user) { FactoryBot.create :user }

    it "view user details" do
      get :show, params: { id: user.id }
      assigns(:user).should eq(user)
    end

    it "renders the #show view" do
      get :show, params: { id: user.id }
      response.should render_template :show
    end
  end




end
