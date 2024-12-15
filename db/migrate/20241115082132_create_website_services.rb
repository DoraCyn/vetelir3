class CreateWebsiteServices < ActiveRecord::Migration[7.2]
  def change
    create_table :website_services do |t|
      t.string :header

      t.references :types_of_services, foreign_key: true

      t.bigint :price

      t.timestamps
    end
  end
end
