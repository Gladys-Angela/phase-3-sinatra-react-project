class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/todos/" do
    todos.to_json
  end
end 
 # post "/todos/" do
   # todo = Todo.create(title: params[:title])
    #todo.to_json

 # end

 # patch "/todos/:id" do
   # todo = Todo.find(params[:id])
   # todo.update(title: params[:title])
    #todo.to_json
  #end
  
  #delete "/todos/:id" do
  #  todo = Todo.find(params[:id])
   # todo.destroy
    #todo.to_json
  #end
#end

