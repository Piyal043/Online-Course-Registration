# Courses Controller
class CoursesController < ApplicationController
  def new
    @course = Course.new
  end
end
