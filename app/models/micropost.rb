class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user    # Indicates association with User

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope order: 'microposts.created_at DESC'
  #http://stackoverflow.com/questions/2382642/ruby-on-rails-how-to-pull-out-most-recent-entries-from-a-limited-subset-of-a-da
  scope :recent, :limit => 5, :order => 'microposts.created_at DESC'
end
