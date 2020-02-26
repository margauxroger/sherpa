class ChaptersController < ApplicationController
  def new
    @courses = Course.all
    @chapter = Chapter.new
  end

  def create
    authorize current_user
    @chapter = Chapter.new(params_chapter)
    @material = Material.find(params[:chapter][:material])
    @chapter.material = @material
    if @chapter.save
      redirect_to teachers_root_path
    else
      render :new
    end
  end

  private

  def params_chapter
    params.require(:chapter).permit(:name, :content)
  end
end
