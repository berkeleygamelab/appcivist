class AddShitToVoting < ActiveRecord::Migration
  def change
    add_column :response_votes, :value, :integer
  end
end
