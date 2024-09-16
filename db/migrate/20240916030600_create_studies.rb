class CreateStudies < ActiveRecord::Migration[7.0]
  def change
    create_table :studies do |t|
      t.string :title, null: false
      t.string :goal
      t.text :content
      t.text :review
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
