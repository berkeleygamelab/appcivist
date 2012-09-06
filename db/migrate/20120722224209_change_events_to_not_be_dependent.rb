class ChangeEventsToNotBeDependent < ActiveRecord::Migration
  def up
    remove_column :events, :challenge_id
    add_column :events, :challenge_id, :integer
  end

  def down
  end
end
