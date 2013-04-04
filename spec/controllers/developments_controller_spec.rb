require 'spec_helper'

describe DevelopmentsController do
    before do
        FactoryGirl.create(:user)
        FactoryGirl.create(:site)
        @category = FactoryGirl.create(:category)
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

        it "decorates the array" do
            assigns(:developments).should be_decorated
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
            @params_development = {development: {user_attributes: FactoryGirl.attributes_for(:user), site_attributes: FactoryGirl.attributes_for(:site), category_id: @category.id}}
        end

        context "assings" do
            before do
                post :create, @params_development
            end

            it "a user with same username as passed" do
                assigns(:user).username == @params_development[:development][:user_attributes][:username]
            end

            it "a site with same name as passed" do
                assigns(:site).name == @params_development[:development][:site_attributes][:name]
            end
        end

        context "with valid attributes" do
            it "creates a new development" do
                expect {
                    post :create, @params_development
                }.to change(Development, :count).by(1)
            end

            it "redirects to development's site" do
                post :create, @params_development
                response.should redirect_to Development.last.site
            end
        end

        context "with invalid attributes" do
            it "does not save the new development" do
                expect {
                    post :create, @params_development.merge(development: {})
                }.to_not change(Development, :count)
            end

            it "re-renders the new method" do
                post :create, @params_development.merge(development: {})
                response.should render_template :new
            end
        end
    end
end
