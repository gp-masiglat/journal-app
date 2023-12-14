class TasksController < ApplicationController
  before_action :check_category_count, only: %i[new create edit update show]
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_categories, only: %i[new create edit update]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.includes(:category).all
    @tasks_due_today = Task.where("deadline = ?", Date.today)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    # @category = @task.category
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
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
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
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
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
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
      params.require(:task).permit(:task_name, :task_details, :is_finished, :deadline, :category_id)
    end
    
    def set_categories
      @categories = Category.all
    end

    def check_category_count
      if Category.count.zero?
        redirect_to new_category_path, notice: "Categories count is 0.Create a category first!"
      end
    end
end
