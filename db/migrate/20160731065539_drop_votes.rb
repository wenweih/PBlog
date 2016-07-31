class DropVotes < ActiveRecord::Migration
  def change
    drop_table  :votes
    drop_table  :comments
  end
end
