class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :chef_id
      t.integer :recipe_id
    end
  end
end
