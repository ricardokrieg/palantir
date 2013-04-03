# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Site < ActiveRecord::Base
    has_many :developments

    validates :name, presence: true, uniqueness: {scope: [:url]}
    validates :url, presence: true
end
