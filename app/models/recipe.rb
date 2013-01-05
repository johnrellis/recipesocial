class Recipe < ActiveRecord::Base
  #constant
  SPICE_LEVELS = %w(Wimpy Medium Spicy Hell!)

  attr_accessible :method, :name, :user_id, :gluten_free, :spice_level
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true
  validates :method, presence: true
  validates :gluten_free, inclusion: {in: [true, false]}
  validates :spice_level, inclusion: {in: %w(Wimpy Medium Spicy Hell!)}


  default_scope order: 'recipes.created_at DESC'
  #http://stackoverflow.com/questions/2382642/ruby-on-rails-how-to-pull-out-most-recent-entries-from-a-limited-subset-of-a-da
  scope :recent, :limit => 5, :order => 'recipes.created_at DESC'

  def gluten_free_text
    gluten_free ? "Gluten Free!" : "May Contain Gluten!"
  end

  def spice_drop_down_selection
    SPICE_LEVELS.collect { |level| [level, level] }
  end

end
