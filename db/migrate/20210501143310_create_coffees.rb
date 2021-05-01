class CreateCoffees < ActiveRecord::Migration[5.2]
  def change
    create_table :coffees do |t|
      t.integer :user_id
      t.string :name
      t.string :roaster
      t.string :producer
      t.string :variety
      t.string :process
      t.string :notes
    end
  end
end
