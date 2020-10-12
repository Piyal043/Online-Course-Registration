class AddStatusToSemesters < ActiveRecord::Migration[6.0]
  def change
    add_column :semesters, :status, :boolean
  end
end
