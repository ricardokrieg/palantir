# == Schema Information
#
# Table name: developments
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  site_id     :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Development do
    before do
        FactoryGirl.create(:user)
        FactoryGirl.create(:site)
        FactoryGirl.create(:category)
    end

    it "has a valid factory" do
        FactoryGirl.create(:development).should be_valid
    end

    describe "is invalid" do

        it "without a user" do
            FactoryGirl.build(:development, user_id: nil).should_not be_valid
        end

        it "without a site" do
            FactoryGirl.build(:development, site_id: nil).should_not be_valid
        end

        it "without a category" do
            FactoryGirl.build(:development, category_id: nil).should_not be_valid
        end

        it "when user doesn't exist" do
            FactoryGirl.build(:development, user_id: 0).should_not be_valid
        end

        it "when site doesn't exist" do
            FactoryGirl.build(:development, site_id: 0).should_not be_valid
        end

        it "when category doesn't exist" do
            FactoryGirl.build(:development, category_id: 0).should_not be_valid
        end
    end

    it "disallows duplicate for same user, site and category" do
        development = FactoryGirl.create(:development)

        FactoryGirl.build(:development, user_id: development.user_id, site_id: development.site_id, category_id: development.category_id).should_not be_valid
    end
end
