class Admin::CoursesController < Admin::BaseController

  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @q = SearchParams.new(params[:search_params] || {})
    @courses = Course.default_where(@q.attributes(self)).page(params[:page]).per(10)
  end

  def new
    @html_title =  "New Course"
    @course =  Course.new
    render :layout => false
  end

  def edit
    @html_title = "Edit Course"
    render :layout => false
  end

  def show
    @html_title =  "Show Course"
    render :layout => false
  end

  def update
    respond_to do |format|
      if @course.update_attributes(permitted_resource_params)
        format.json { render :json=>{:success=>true} }
      else
        format.json { render :json=>{:success=>false} }
      end
    end
  end

  def create
    @course = Course.new
    @course.attributes = permitted_resource_params
    if @course.save
      flash[:success] = flash_message_for(@course, :successfully_created)
      respond_with(@course) do |format|
        format.html { redirect_to location_after_save }
        format.js   { render :layout => false }
      end
    else
      respond_with(@course) do |format|
        format.html do
          flash.now[:error] = @course.errors.full_messages.join(", ")
          render action: 'new'
        end
        format.js { render layout: false }
      end
    end
  end

  def destroy
    @course.course_status = params[:course_status] if params[:course_status]
    if @course.save
      respond_to do |format|
        format.js
      end
    else
      respond_with(@course) do |format|
        format.html { redirect_to location_after_destroy }
      end
    end
  end

  private

  def permitted_resource_params
    params.require(:course).permit!
  end

  def set_course
    @course = Course.find(params[:id])
  end

end