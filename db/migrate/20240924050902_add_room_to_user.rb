class AddRoomToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :room
  end
end
