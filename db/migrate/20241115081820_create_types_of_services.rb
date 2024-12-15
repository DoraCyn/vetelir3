class CreateTypesOfServices < ActiveRecord::Migration[7.2]
  def change
    create_table :types_of_services do |t|
      t.string :type

      t.timestamps
    end
  end
end
