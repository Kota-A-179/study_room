class AddStudyTimeToStudy < ActiveRecord::Migration[7.0]
  def change
    add_column :studies, :study_time, :integer
  end
end
