class Recipe < ActiveRecord::Base
  attr_accessible :method, :name, :user_id
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true
  validates :method, presence: true
end
