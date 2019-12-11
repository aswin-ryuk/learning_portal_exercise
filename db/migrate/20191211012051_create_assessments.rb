class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :user_option
      t.string :is_correct
      t.string :is_skipped, default: 'N'

      t.timestamps
    end
  end
end
