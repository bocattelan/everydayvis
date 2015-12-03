class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :date
      t.references :person, index: true

      t.timestamps null: false
    end
    add_foreign_key :days, :people
  end
end
