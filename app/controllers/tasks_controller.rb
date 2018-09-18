TASKS = [{id:1, task:"trash",description: "take trash out to curb",completiondate:"9-19-18"},
{id:2,task:"clean bathroom",description: "wipe the counter and clean toilet",completiondate:"9-20-18"},
{id:3,task:"dishes",description: "put dishes in dishwasher",completiondate:"9-21-18"},
{id:4,task:"cook",description: "make food",completiondate:"9-22-18"}]



class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end

  def show
    id = params[:id]
    @task = TASKS.find do |task|
      task[:id] == id.to_i
    end
end

end
