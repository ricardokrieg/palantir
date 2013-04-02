# == Schema Information
#
# Table name: actions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Action < ActiveRecord::Base
    has_many :changes

    validates :name, presence: true, uniqueness: true
end
