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
       @in_completed_tasks = Task.in_complete
        ids = params[:task_ids]
        if ids
            ids.each do |id|
                answer = Task.where(id: id).first.name
                Answer.create(feedback: answer)
                # Answers table
                # row 1: task_id: 1
                # row 2: task_id: 1
                # row 3: feedback: "Do you have a bus?"
                # answer ===> "Do you have a car?"
                ActionCable.server.broadcast 'web_notifications_channel',
                                       message:  answer
            end
        end
          
         respond_to do |format|  
                # format.html {redirect_to root_path}
                format.js  # renders => 'app/views/tasks/complete.js.erb'
          end  
    end     
private 
   def allowed_tasks_params
       # HTTP Form Data
    #   params = { task: { name: 'HELLO', complete: true, task_ids: [1,3]}}
    #   params
       params.require(:task).permit(:name , :complete)
       
       # puts params[:task] # => ['Doyu', '.adfsd', 'asdf']
       # params[:task]
       # task[] <--- 1
       # task_ids[]
       # task[] <--- 2
       # task[] <--- 3
   end
    
end  

