class TeachersController < ApplicationController
  def new
    get_school
    @teacher = @school.teachers.build
  end

  def show
    get_school
    @teacher = Teacher.find(params[:id])
  end

  def edit
    get_school
    @teacher = Teacher.find(params[:id])
  end

  def update
    get_school
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_params)
      redirect_to school_path(params[:school_id])
    else
      render 'edit'
    end
  end

  def destroy
    get_school
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    redirect_to school_path(params[:school_id])
  end

  def create
    get_school
    @teacher = @school.teachers.build(teacher_params)
    if @teacher.save
      redirect_to school_path(params[:school_id])
    else
      render 'new'
    end
  end

  def get_school
   @school = School.find(params[:school_id])
  end

  private

    def teacher_params
      params.require(:teacher).permit(:firstName, :lastName, :middleName, :school_id)
    end
end
