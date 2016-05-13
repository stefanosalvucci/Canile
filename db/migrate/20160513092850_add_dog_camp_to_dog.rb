class AddDogCampToDog < ActiveRecord::Migration
  def change
    add_reference :dogs, :dog_camp, index: true, foreign_key: true
  end
end
