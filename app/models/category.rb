class Category < ActiveRecord::Base
    has_many :developments

    validates :name, presence: true, uniqueness: true
end
