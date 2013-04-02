require 'spec_helper'

describe User do
    it "has a valid factory" do
        FactoryGirl.create(:user).should be_valid
    end

    it "is invalid without a email" do
        FactoryGirl.build(:user, email: nil).should_not be_valid
    end

    it "is invalid without a username" do
        FactoryGirl.build(:user, username: nil).should_not be_valid
    end

    it "is invalid without a provider" do
        FactoryGirl.build(:user, provider: nil).should_not be_valid
    end

    it "is invalid without a uid" do
        FactoryGirl.build(:user, uid: nil).should_not be_valid
    end
end
