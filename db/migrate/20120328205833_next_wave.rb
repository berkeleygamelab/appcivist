class NextWave < ActiveRecord::Migration
  def up
  remove_column :challenges, :submission_deadline
    
  add_column :challenges, :voting_deadline, :datetime
  add_column :challenges, :submission_deadline, :datetime
  end

  def down
  end
end
