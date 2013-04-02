require 'spec_helper'

describe Change do
    it "has a valid factory" do
        FactoryGirl.create(:change).should be_valid
    end

    it "is invalid without a user" do
        FactoryGirl.build(:change, user_id: nil).should_not be_valid
    end

    it "is invalid without a action" do
        FactoryGirl.build(:change, action_id: nil).should_not be_valid
    end

    it "is invalid without a development" do
        FactoryGirl.build(:change, development_id: nil).should_not be_valid
    end
end
