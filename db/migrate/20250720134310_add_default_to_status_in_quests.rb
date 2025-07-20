class AddDefaultToStatusInQuests < ActiveRecord::Migration[8.0]
  def up
    change_column_default :quests, :status, false
    # แก้ค่า null เป็น false ด้วย เพื่อ consistency
    Quest.where(status: nil).update_all(status: false)
  end

  def down
    change_column_default :quests, :status, nil
  end
end
