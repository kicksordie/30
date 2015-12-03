class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_teacher

  def new
    get_teacher
    @rating = current_user.ratings.build
  end

  def create
    get_teacher
    @rating = current_user.ratings.create(rating_params)
    if @rating.save
      redirect_to school_teacher_path(@teacher.school, @teacher)
    else
      render 'new'
    end
  end

  def destroy
    get_teacher
    @rating = @teacher.ratings.find(params[:id])
    @rating.destroy

    redirect_to school_teacher_path(@teacher.school, @teacher)
  end

  def get_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  private

    def rating_params
      params.require(:rating).permit(:easiness, :helpfulness, :clarity, :comment,
      :teacher_id, :school_id)
    end
end
