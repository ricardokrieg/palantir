require 'spec_helper'

describe DevelopmentsController do
    before do
        FactoryGirl.create(:user)
        FactoryGirl.create(:site)
        FactoryGirl.create(:category)
    end

    describe "GET :index" do
        before do
            @development = FactoryGirl.create(:development)
        end

        before :each do
            get :index
        end

        it "populates an array of developments" do
            assigns(:developments).should eq([@development])
        end

        it "doesn't populate more than 10 developments" do
            assigns(:developments).size.should <= 10
        end

        it "renders the :index template" do
            response.should render_template :index
        end
    end

    describe "GET :new" do
        it "renders the :new template" do
            get :new
            response.should render_template :new
        end
    end

    describe "POST :create" do
        before do
            @params_development = {user: {username: 'ricardokrieg'}, site: {name: 'Palantir', url: 'palantir.com'}, category_id: 1}
            post :create, @params_development
        end

        it "assigns a user with same username as passed" do
            assigns(:user).username == @params_development[:user][:username]
        end

        it "assigns a site with same name as passed" do
            assigns(:site).name == @params_development[:site][:name]
        end

        it "assigns a site with same url as passed" do
            assigns(:site).url == @params_development[:site][:url]
        end

        context "with valid attributes" do
        end

        context "with invalid attributes" do
        end
    end
end
