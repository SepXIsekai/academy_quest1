class AddStatusToQuests < ActiveRecord::Migration[8.0]
  def change
    add_column :quests, :status, :boolean
  end
end
