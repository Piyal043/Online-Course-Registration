class AddSemesterToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :semester_id, :integer
  end
end
