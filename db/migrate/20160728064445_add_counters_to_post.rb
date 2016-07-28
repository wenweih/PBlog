class AddCountersToPost < ActiveRecord::Migration
  def change
    add_column :posts, :counters, :integer, :null => false, :default => 0
  end
end
