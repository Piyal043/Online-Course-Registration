# Semester model
class Semester < ApplicationRecord
  has_many :courses
  validates :name, presence: true
end
