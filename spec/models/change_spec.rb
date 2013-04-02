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
