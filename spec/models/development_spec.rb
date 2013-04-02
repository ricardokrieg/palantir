require 'spec_helper'

describe Development do
    it "has a valid factory" do
        FactoryGirl.create(:development).should be_valid
    end

    it "is invalid without a user" do
        FactoryGirl.build(:development, user_id: nil).should_not be_valid
    end

    it "is invalid without a site" do
        FactoryGirl.build(:development, site_id: nil).should_not be_valid
    end

    it "is invalid without a category" do
        FactoryGirl.build(:development, category_id: nil).should_not be_valid
    end

    it "is invalid with duplicate user, site and category" do
        development = FactoryGirl.create(:development)

        FactoryGirl.build(:development, user_id: development.user_id, site_id: development.site_id, category_id: development.category_id).should_not be_valid
    end
end
