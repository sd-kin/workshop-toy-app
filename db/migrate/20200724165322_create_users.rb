class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :address
      t.string :role
      t.float :position_lat
      t.float :position_lon

      t.timestamps
    end
  end
end
