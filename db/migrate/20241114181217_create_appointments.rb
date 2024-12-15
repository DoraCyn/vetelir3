class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :phone
      t.string :animal_type
      t.text :description

      t.timestamps
    end
  end
end
