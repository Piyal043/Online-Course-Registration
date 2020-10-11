# Course Model
class Course < ApplicationRecord
  belongs_to :semester
  validates :credit, presence: true
  validates :number, presence: true
  validates :title, presence: true
  validates :semester_id, presence: true
end

