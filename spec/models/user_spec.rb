require 'spec_helper'

describe User do
    it "has a valid factory" do
        FactoryGirl.create(:user).should be_valid
    end

    describe "is invalid without a" do
        it "email" do
            FactoryGirl.build(:user, email: nil).should_not be_valid
        end

        it "username" do
            FactoryGirl.build(:user, username: nil).should_not be_valid
        end

        it "provider" do
            FactoryGirl.build(:user, provider: nil).should_not be_valid
        end

        it "uid" do
            FactoryGirl.build(:user, uid: nil).should_not be_valid
        end
    end

    describe "disallow duplicates for" do
        before :each do
            @user = FactoryGirl.create(:user)
        end

        it "username" do
            FactoryGirl.build(:user, username: @user.username).should_not be_valid
        end

        it "email" do
            FactoryGirl.build(:user, email: @user.email).should_not be_valid
        end

        it "uid" do
            FactoryGirl.build(:user, uid: @user.uid).should_not be_valid
        end
    end

    it "accepts github as a provider" do
        FactoryGirl.build(:user, provider: 'github').should be_valid
    end

    it "rejects any provider that is not github" do
        FactoryGirl.build(:user, provider: 'facebook').should_not be_valid
    end
end
