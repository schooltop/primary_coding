class Admin::EmployeeCoursesController < Admin::BaseController

  def index
    @q = SearchParams.new(params[:search_params] || {})
    @employee_courses = EmployeeCourse.default_where(@q.attributes(self)).page(params[:page]).per(10)
  end

  def new
    @html_title =  "New EmployeeCourse"
    @employee_course =  EmployeeCourse.new
    render :layout => false
  end

  def edit
    @html_title = "Edit EmployeeCourse"
    @employee_course =  EmployeeCourse.find(params[:id])
    render :layout => false
  end

  def show
    @html_title =  "Show EmployeeCourse"
    @employee_course =  EmployeeCourse.find(params[:id])
    render :layout => false
  end

  def update
    @employee_course = EmployeeCourse.find(params[:id])

    respond_to do |format|
      if @employee_course.update_attributes(permitted_resource_params)
        format.json { render :json=>{:success=>true} }
      else
        format.json { render :json=>{:success=>false} }
      end
    end
  end

  def create
    @employee_course = EmployeeCourse.new
    @employee_course.attributes = permitted_resource_params
    if @employee_course.save
      flash[:success] = flash_message_for(@employee_course, :successfully_created)
      respond_with(@employee_course) do |format|
        format.html { redirect_to location_after_save }
        format.js   { render :layout => false }
      end
    else
      respond_with(@employee_course) do |format|
        format.html do
          flash.now[:error] = @employee_course.errors.full_messages.join(", ")
          render action: 'new'
        end
        format.js { render layout: false }
      end
    end
  end

  def destroy
    @employee_course.status = params[:employee_course_status] if params[:employee_course_status]
    if @employee_course.save
      respond_to do |format|
        format.js
      end
    else
      respond_with(@employee_course) do |format|
        format.html { redirect_to location_after_destroy }
      end
    end
  end

  private

  def permitted_resource_params
    params.require(:employee_course).permit!
  end

  def set_course
    @employee_course = EmployeeCourse.find(params[:id])
  end

end