class AddGlutenFreeToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :gluten_free, :boolean, null: false

    Recipe.all.each do |recipe|
      recipe.gluten_free = false
      recipe.save!
    end
  end
end
