# TASKS = [{id:1, task:"trash",description: "take trash out to curb",completiondate:"9-19-18"},
# {id:2,task:"clean bathroom",description: "wipe the counter and clean toilet",completiondate:"9-20-18"},
# {id:3,task:"dishes",description: "put dishes in dishwasher",completiondate:"9-21-18"},
# {id:4,task:"cook",description: "make food",completiondate:"9-22-18"}]



class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:name)
  end

  def show
    id = params[:id].to_i
   @task = Task.find_by(id: id)
    end

    def new
      @task = Task.new
    end

    def create
      @task = Task.new(name: params[:task][:name], description: params[:task][:description], completiondate: params[:task][:completiondate], completed?: params[:task][:completed?])
      if @task.save
        redirect_to root_path
      else
        render :new
      end
    end

    def edit
      @task = Task.find(params[:id].to_i)
    end

    def update
      @task = Task.find_by(id: params[:id].to_i)
      @task.name =  params[:task][:name]
      @task.description = params[:task][:description]
      @task.completiondate =  params[:task][:completiondate]
      if @task.save
        redirect_to task_path
      else
        render :edit
      end
    end

    def destroy
       @task = Task.find(params[:id])
       @task.destroy
       redirect_to root_path
    end

    def complete
      task = Task.find(params[:id])
      task.completiondate = Time.now
      task.save
      redirect_to root_path
    end

    def undo_complete
      task = Task.find(params[:id])
      task.completiondate = nil
      task.save
      redirect_to root_path
    end
  end
