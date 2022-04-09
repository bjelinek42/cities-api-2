class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.integer :population

      t.timestamps
    end
  end
end
