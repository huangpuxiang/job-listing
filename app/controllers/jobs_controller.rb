class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]

  def index
    @jobs = Job.where(is_hidden: false).order("wage_lower_bound DESC")
    @jobs = Job.where(is_hidden: false).order("wage_upper_bound DESC")
    @jobs = Job.where(is_hidden: false).order("updated_at DESC")
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This Job already archived"
      redirect_to root_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path, alert: "新增"
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, alert: "Job deleted"
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end

end
