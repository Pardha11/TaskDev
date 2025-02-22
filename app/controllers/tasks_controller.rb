class TasksController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy mark_as_taken mark_as_pending mark_as_done]
  before_action :set_task, only: %i[show edit update destroy mark_as_taken mark_as_pending mark_as_done]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_path, status: :see_other, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def mark_as_taken
    @task.update(status: "taken")
    respond_to do |format|
      format.html { redirect_to tasks_path, status: :see_other, notice: "Marked as taken." }
      format.json { head :no_content }
    end
  end

  def mark_as_pending
    @task.update(status: "pending")
    respond_to do |format|
      format.html { redirect_to tasks_path, status: :see_other, notice: "Marked as pending." }
      format.json { head :no_content }
    end
  end

  def mark_as_done
    @task.update(status: "done")
    respond_to do |format|
      format.html { redirect_to tasks_path, status: :see_other, notice: "Marked as done." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:price, :short_description, :long_description, :status, :tech)
  end
end
