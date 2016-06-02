class AddPostRefToImage < ActiveRecord::Migration
  def change
    add_reference :images, :post, index: true, foreign_key: true
  end
end
