class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :content
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
