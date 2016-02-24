class CreateSleepJawbones < ActiveRecord::Migration
  def change
    create_table :sleep_jawbones do |t|
      t.datetime :datetime
      t.integer :depth
      t.references :person, index: true

      t.timestamps null: false
    end
  end
end
