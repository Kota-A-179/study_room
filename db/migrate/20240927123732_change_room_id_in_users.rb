class ChangeRoomIdInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :room_id, true
    change_column_default :users, :room_id, nil
  end
end
