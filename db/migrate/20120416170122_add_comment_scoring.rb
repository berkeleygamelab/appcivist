class AddCommentScoring < ActiveRecord::Migration
  def up
	add_column :response_templates, :score, :integer
  end
  def down
	drop_column :response_templates, :score, :integer
  end
end
