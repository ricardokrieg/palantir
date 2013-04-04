# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0)
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string(255)
#  last_sign_in_ip     :string(255)
#  failed_attempts     :integer          default(0)
#  unlock_token        :string(255)
#  locked_at           :datetime
#  created_at          :datetime
#  updated_at          :datetime
#  provider            :string(255)
#  uid                 :string(255)
#  email               :string(255)
#  username            :string(255)
#

require 'spec_helper'

describe User do
    it "has a valid factory" do
        FactoryGirl.create(:user).should be_valid
    end

    describe "finds or creates" do
        before :each do
            @auth = set_omniauth()
            @user = User.find_or_create_github_oauth(@auth)
        end

        it "and return a valid instance" do
            @user.instance_of? User
        end

        it "and return the right user" do
            @user.email.should == @auth.info.email
        end
    end
end
