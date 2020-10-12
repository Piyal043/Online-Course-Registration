# Semester controller
class SemestersController < ApplicationController
  before_action :set_semester, only: %i[edit update show destroy]
  before_action :require_admin, except: [:index]
  def index
    @semesters = Semester.all
  end

  def new
    @semester = Semester.new
  end

  def create
    @semester = Semester.new(semester_params)
    if params.require(:semester)[:status] == "true"
      @active_semester= Semester.find_by_status(true)
      @active_semester.status = false
      @active_semester.save
    end
    if @semester.save
      flash[:notice] = 'Semester was created successfully'
      redirect_to semester_path(@semester)
    else
      render 'new'
    end
  end

  def edit; end

  def show
    @courses = @semester.courses
  end

  def update
    if params.require(:semester)[:status] == "true"
      @active_semester= Semester.find_by_status(true)
      @active_semester.status = false
      @active_semester.save
    end
    if @semester.update(semester_params)
      flash[:notice] = 'Semester was successfully updated'
      redirect_to semester_path(@semester)
    else
      render 'edit'
    end
  end

  def destroy
    @semester.destroy
    flash[:notice] = 'Semester was deleted successfully'
    redirect_to semesters_path
  end

  private

  def set_semester
    @semester = Semester.find(params[:id])
  end

  def semester_params
    params.require(:semester).permit(:name, :status)
  end

  def require_admin
    return unless logged_in? && !current_user.admin?

    flash[:danger] = 'Only admin can perform this action'
    redirect_to root_path
  end
end
