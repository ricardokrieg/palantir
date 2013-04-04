# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Site < ActiveRecord::Base
    has_many :developments

    validates :name, presence: true
end
