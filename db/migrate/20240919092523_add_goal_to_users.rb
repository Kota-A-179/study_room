class AddGoalToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :goal, :string
  end
end
