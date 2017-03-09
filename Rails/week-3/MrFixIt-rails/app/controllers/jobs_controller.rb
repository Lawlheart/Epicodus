class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @jobs = Job.all
  end

  def new
   @job = Job.new
  end

  def show
  end

  def create
    @job = Job.new(job_params)
    respond_to do |format|
      if @job.save
        format.html { redirect_to jobs_path, notice: "Job Saved Successfully" }
        format.js
      else
        format.html {render :new, notice: 'There was an error.'}
        format.js { redirect_back(fallback_location: jobs_path, notice: 'There was an error.') }
      end
    end
  end

  def update
    if params[:status] == 'claimed' && current_user.worker && @job.update(pending: true, worker_id: current_user.id)
      respond_to do |format|
        format.html {redirect_to jobs_path, notice: "You've successfully claimed this job."}
        format.js
      end
    elsif params[:status] == 'completed' && current_user.worker && @job.update(pending: false, completed: true)
      respond_to do |format|
        format.html {redirect_to jobs_path, notice: "You've successfully completed this job."}
        format.js
      end
    else
      flash[:notice] = 'Error: There was something wrong with your request.'
      redirect_to jobs_path
    end
  end

  def destroy
    @job_id = @job.id
    @job.destroy
  end

private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :pending, :completed)
  end

end
