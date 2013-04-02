require 'spec_helper'

describe Action do
    it "has a valid factory" do
        FactoryGirl.create(:action).should be_valid
    end

    it "is invalid without a name" do
        FactoryGirl.build(:action, name: nil).should_not be_valid
    end

    it "is invalid with duplicate name" do
        action = FactoryGirl.create(:action)

        FactoryGirl.build(:action, name: action.name).should_not be_valid
    end
end
