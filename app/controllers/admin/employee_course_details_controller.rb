class Admin::EmployeeCourseDetailsController < Admin::BaseController

  before_action :set_employee_course_detail, only: [:show, :edit, :update, :destroy]

  def index
    @q = SearchParams.new(params[:search_params] || {})
    @employee_course_details = EmployeeCourseDetail.default_where(@q.attributes(self)).page(params[:page]).per(10)
  end

  def new
    @html_title =  "New EmployeeCourseDetail"
    @employee_course_detail =  EmployeeCourseDetail.new
    render :layout => false
  end

  def edit
    @html_title = "Edit EmployeeCourseDetail"
    render :layout => false
  end

  def show
    @html_title =  "Show EmployeeCourseDetail"
    render :layout => false
  end

  def update
    respond_to do |format|
      if @employee_course_detail.update_attributes(permitted_resource_params)
        format.json { render :json=>{:success=>true} }
      else
        format.json { render :json=>{:success=>false} }
      end
    end
  end

  def create
    @employee_course_detail = EmployeeCourseDetail.new
    @employee_course_detail.attributes = permitted_resource_params
    if @employee_course_detail.save
      flash[:success] = flash_message_for(@employee_course_detail, :successfully_created)
      respond_with(@employee_course_detail) do |format|
        format.html { redirect_to location_after_save }
        format.js   { render :layout => false }
      end
    else
      respond_with(@employee_course_detail) do |format|
        format.html do
          flash.now[:error] = @employee_course_detail.errors.full_messages.join(", ")
          render action: 'new'
        end
        format.js { render layout: false }
      end
    end
  end

  def destroy
    @employee_course_detail.status = params[:employee_course_detail_status] if params[:employee_course_detail_status]
    if @employee_course_detail.save
      respond_to do |format|
        format.js
      end
    else
      respond_with(@employee_course_detail) do |format|
        format.html { redirect_to location_after_destroy }
      end
    end
  end

  private

  def permitted_resource_params
    params.require(:employee_course_detail).permit!
  end

  def set_employee_course_detail
    @employee_course_detail = EmployeeCourseDetail.find(params[:id])
  end

end