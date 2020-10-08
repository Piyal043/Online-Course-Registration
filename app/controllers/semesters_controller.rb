class SemestersController < ApplicationController
  before_action :set_semester, only: [:edit, :update, :show, :destroy]
  before_action :require_admin, except: [:index]
  def index
    @semesters = Semester.all
  end

  def new
    @semester = Semester.new
  end

  def create
    @semester = Semester.new(semester_params)
    if @semester.save
      flash[:notice] = "Semester was created successfully"
      redirect_to semester_path(@semester)
    else
      render 'new'
    end
  end

  def edit

  end

  def show

  end

  def update
    if @semester.update(semester_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to semester_path(@semester)
    else
      render 'edit'
    end
  end

  def destroy
    @semester.destroy
    flash[:notice] = "Semester was deleted successfully"
    redirect_to semesters_path
  end

  private
  def set_semester
    @semester = Semester.find(params[:id])
  end
  def semester_params
    params.require(:semester).permit(:name)
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin can perform this action"
      redirect_to root_path
    end
  end

end