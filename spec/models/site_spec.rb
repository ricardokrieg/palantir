require 'spec_helper'

describe Site do
    it "has a valid factory" do
        FactoryGirl.create(:site).should be_valid
    end

    it "is invalid without a url" do
        FactoryGirl.build(:site, url: nil).should_not be_valid
    end

    it "is invalid without a name" do
        FactoryGirl.build(:site, name: nil).should_not be_valid
    end
end
