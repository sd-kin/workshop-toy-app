class AddModerationAbilityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profession, :string
    add_column :users, :workplace, :string
    add_column :users, :banned, :boolean
    add_column :users, :deleted, :boolean
  end
end
