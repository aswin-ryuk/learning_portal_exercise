class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :chapter_id
      t.string :category
      t.text :options
      t.string :correct_option

      t.timestamps
    end
  end
end
