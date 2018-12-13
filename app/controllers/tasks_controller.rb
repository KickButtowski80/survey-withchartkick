class TasksController < ApplicationController
    def index
        @completed_tasks = Task.complete
        @in_completed_tasks = Task.in_complete
        @answers = Answer.all
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.create(allowed_tasks_params)
        if @task.save
            flash[:success] =  "Task was saved"
           redirect_to tasks_path
        else
            flash.now[:danger] = "something went wrong"
            render 'new'
        end
    end
    
    def complete
    
    ids = params[:task_ids]
    if ids
        ids.each do |id|
            answer = Task.where(id: id).first.name
            Answer.create(feedback: answer)
            ActionCable.server.broadcast 'web_notifications_channel',
                                   message:  answer
        end
    end
      
       respond_to do |format|  
            format.html {redirect_to root_path}
            format.js  
        end  
    end
    
        
private 
   def allowed_tasks_params
       params.require(:task).permit(:name , :complete)
   end
end
