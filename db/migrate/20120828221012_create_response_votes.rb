class CreateResponseVotes < ActiveRecord::Migration
  def change
    create_table :response_votes do |t|
      t.integer :response_id
      t.string :type_like
      t.integer :user_id
      t.timestamps
    end
  end
end
