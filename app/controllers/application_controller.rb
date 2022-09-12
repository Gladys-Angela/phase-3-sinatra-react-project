class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/todos/" do
    todos.to_json
  end

  post "/todos/" do
    #message = Message.create(body: params[:body], username: params[:username])
    message.to_json

  end

  patch "/todos/:id" do
    #todo = Message.find(params[:id])
    #todo.update(body: params[:body])
    todo.to_json
  end
  
  delete "/todos/:id" do
   # todo = Todo.find(params[:id])
    #todo.destroy
    todo.to_json
  end
end

