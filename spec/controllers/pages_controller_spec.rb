require 'spec_helper'

describe PagesController do

    describe "GET 'home'" do
        it "returns http success" do
            get 'home'
            response.should be_success
        end

        it "renders the :home view"
    end

end
