class ChangeReferencesFromPersonToDay < ActiveRecord::Migration
  def change
    rename_column :activities,   :person_id, :day_id
    rename_column :luminosities, :person_id, :day_id
    rename_column :locations,    :person_id, :day_id
    rename_column :weathers,     :person_id, :day_id
    rename_column :daylights,    :person_id, :day_id
    rename_column :works,        :person_id, :day_id
    rename_column :appointments, :person_id, :day_id
  end
end
