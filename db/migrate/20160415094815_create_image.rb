class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.belongs_to(:book, index: true)
      t.timestamps null: false
    end
  end
end
