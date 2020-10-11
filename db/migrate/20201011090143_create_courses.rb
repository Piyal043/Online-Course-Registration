class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :number
      t.string :title
      t.integer :credit
    end
  end
end
