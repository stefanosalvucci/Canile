class CreateDogCamps < ActiveRecord::Migration
  def change
    create_table :dog_camps do |t|
      t.string :name
      t.string :address
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
