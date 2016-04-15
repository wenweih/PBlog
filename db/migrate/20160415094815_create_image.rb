class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.belongs_to(:books, index: true)
      t.timestamps null: false
    end
  end
end
