class Recipe < ActiveRecord::Base
  attr_accessible :method, :name, :user_id
  belongs_to :user

  validates :name, presence: true
  validates :method, presence: true
end
