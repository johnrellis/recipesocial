class AddSpiceLevelToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :spice_level, :string, null: false

    Recipe.all.each do |recipe|
      recipe.spice_level = Recipe::SPICE_LEVELS[0]
      recipe.save!
    end
  end
end
