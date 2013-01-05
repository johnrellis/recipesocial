class Recipe < ActiveRecord::Base
  attr_accessible :method, :name, :user_id, :gluten_free
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true
  validates :method, presence: true
  validates :gluten_free,inclusion:  {in: [true, false]}

  default_scope order: 'recipes.created_at DESC'
  #http://stackoverflow.com/questions/2382642/ruby-on-rails-how-to-pull-out-most-recent-entries-from-a-limited-subset-of-a-da
  scope :recent, :limit => 5, :order => 'recipes.created_at DESC'

  def gluten_free_text
    gluten_free ? "Gluten Free!" : "May Contain Gluten!"
  end

end
