class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :friend_url
      t.text :content
      t.integer :count,default:0
      t.string :slug,index: { unique: true}
      t.belongs_to :user,index:true
    end
  end
end
