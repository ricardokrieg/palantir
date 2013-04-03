# == Schema Information
#
# Table name: changes
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  development_id :integer
#  action_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Change do
    before do
        FactoryGirl.create(:user)
        FactoryGirl.create(:action)
        FactoryGirl.create(:category)
        FactoryGirl.create(:site)
        FactoryGirl.create(:development)
    end

    it "has a valid factory" do
        FactoryGirl.create(:change).should be_valid
    end

    describe "is invalid" do
        it "without a user" do
            FactoryGirl.build(:change, user_id: nil).should_not be_valid
        end

        it "without a action" do
            FactoryGirl.build(:change, action_id: nil).should_not be_valid
        end

        it "without a development" do
            FactoryGirl.build(:change, development_id: nil).should_not be_valid
        end

        it "when user doesn't exist" do
            FactoryGirl.build(:change, user_id: 0).should_not be_valid
        end

        it "when action doesn't exist" do
            FactoryGirl.build(:change, action_id: 0).should_not be_valid
        end

        it "when development doesn't exist" do
            FactoryGirl.build(:change, development_id: 0).should_not be_valid
        end
    end
end
