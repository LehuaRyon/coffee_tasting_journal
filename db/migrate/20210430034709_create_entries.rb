class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :content
      t.integer :coffee_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
