class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title

      t.timestamps
    end
    add_reference :posts, :category, foreign_key: true, index: true
  end
end
