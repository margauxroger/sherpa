class Students::StudentsController < ApplicationController

  def index
    @user = current_user
    authorize @user
    div_id = @user.division.id
    @course_students = User.where("division_id = #{div_id}").first(40)
    policy_scope(User)

    @user_index = @course_students.index(@user)

    half = @course_students.each_slice(20).to_a

    @test_user = User.find(1154)

    @half_class1 = half[0]
    @half_class2 = half[1]

    start_week = 26

    current_week = Date.today.cweek

    week_indexation = current_week - start_week

    @buddy_index = @course_students.index(@user) + week_indexation

    if @buddy_index >= 20
      @buddy_index -= 20
    end

    if @course_students.index(@user) < 20
      @buddy = @half_class2[@buddy_index]
      # @last_buddy = @half_class2[@buddy_index - 1]
      # @next_buddy = @half_class2[@buddy_index + 1]
    else
      @buddy = @half_class1[@buddy_index]
      # @last_buddy = @half_class1[21 - @course_students.index(@test_user) + week_indexation - 1]
      # @next_buddy = @half_class1[21 - @course_students.index(@test_user) + week_indexation + 1]
    end

  end

end
