class Teachers::BuddiesController < ApplicationController

  def index
    @user = current_user
    authorize @user
    policy_scope(User)
    @course  = Course.find(params[:course_id])
    @course_students = User.where("division_id = #{@course.division.id}").first(40)
    @material = @course.material

    # @user_index = @course_students.index(@user)

    half = @course_students.each_slice(20).to_a

    @half_class1 = half[0]
    @half_class2 = half[1]

    start_week = 26
    current_week = Date.today.cweek
    @week_indexation = current_week - start_week

    @buddies = []
  end

end
