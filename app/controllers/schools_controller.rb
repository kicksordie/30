class SchoolsController < ApplicationController
  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])

    if @school.update(school_params)
      redirect_to schools_path
    else
      render 'edit'
    end
  end

  def index
    @schools = School.all
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to schools_path
    else
      render 'new'
    end
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy

    redirect_to schools_path
  end

  private

    def school_params
      params.require(:school).permit(:name)
    end
end
