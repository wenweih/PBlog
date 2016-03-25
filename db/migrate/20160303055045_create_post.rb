class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :count,default:0
      t.belongs_to :user,index:true
    end
  end
end
