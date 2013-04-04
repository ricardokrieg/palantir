# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Site do
    it "has a valid factory" do
        FactoryGirl.create(:site).should be_valid
    end
end
