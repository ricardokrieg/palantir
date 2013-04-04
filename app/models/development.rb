# == Schema Information
#
# Table name: developments
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  site_id     :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Development < ActiveRecord::Base
    belongs_to :user
    belongs_to :site
    belongs_to :category
    has_many :changes

    validates :user_id, uniqueness: {scope: [:site_id, :category_id]}
    validates :site, :user, :category, presence: true

    accepts_nested_attributes_for :user, :site
end
