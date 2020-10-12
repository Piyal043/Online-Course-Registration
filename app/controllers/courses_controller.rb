# Courses Controller
class CoursesController < ApplicationController
  before_action :set_course, only: %i[edit update show destroy]
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def edit; end

  def create
    # render plain: params[:course].inspect
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = 'Course was successfully created'
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def update
    if @course.update(course_params)
      flash[:notice] = 'Course was successfully updated'
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    @course.destroy
    flash[:notice] = 'Course was deleted successfully'
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:number, :title, :semester_id, :credit)
  end
end
