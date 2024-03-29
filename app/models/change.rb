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

class Change < ActiveRecord::Base
    belongs_to :user
    belongs_to :development
    belongs_to :action

    validates :user, :action, :development, presence: true
end
