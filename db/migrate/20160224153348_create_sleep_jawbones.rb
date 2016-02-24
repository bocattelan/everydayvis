class CreateSleepJawbones < ActiveRecord::Migration
  def change
    create_table :sleep_jawbones do |t|
      t.datetime :datetime
      t.integer :depth
      t.string :person
      t.string :references

      t.timestamps null: false
    end
  end
end
