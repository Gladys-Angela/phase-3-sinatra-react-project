class Application

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
      # projects get/read 
    if req.path.match(/todos/) && req.get? #controller interprates the request given from the front-end
        #(:include => :title)
      #check if requesting all todos or an individual todo
      if req.path.split("/todos/").length === 1 
        # retrieve information from model and send back information to the front-end
        return [200, { 'Content-Type' => 'application/json' }, [ {:message => "todos successfully requested", :todos => Todo.all}.to_json]]
      else 
        todo = Todo.find_by_path(req.path, "/projects/")
        return [200, { 'Content-Type' => 'application/json' }, [ {:message => "todo successfully requested", :todos => Todo}.to_json]]
      end #check if all todos or specific todo
      
  
  
      # todos post/create (tested)
      elsif req.path.match(/todos/) && req.post?
        hash = JSON.parse(req.body.read)
        todo = Todo.create_new_todo_with_defaults(hash)
  
        if todo.save
          return [200, { 'Content-Type' => 'application/json' }, [ {:message => "todo successfully created", :todo => todo}.to_json]]
        else
          return [422, { 'Content-Type' => 'application/json' }, [ {:error => "todo not added"}.to_json ]]
        end #end validation of post
  
      # projects patch/update (tested)
      elsif req.path.match(/todos/) && req.patch?
        todo = Todo.find_by_path(req.path, "/todos/")
  
        if todo
          data = JSON.parse(req.body.read)
          if todo.update(data)
            return [200, {"Content-Type" => "application/json"}, [{message: "todo successfully updated", todo: todo}.to_json]]
          else
            return [422, {"Content-Type" => "application/json"}, [{error: "todo not updated. Invalid data."}.to_json]]
          end
          #if: todo was updated
        else
          return [404, {"Content-Type" => "application/json"}, [{error: "todo not found."}.to_json]]
        end #if : todo exists
  
      # todo delete
      elsif req.path.match(/todos/) && req.delete?
        todo = Todo.find_by_path(req.path, "/todos/")
  
        if todo && todo.destroy
          return [200, {"Content-Type" => "application/json"}, [{message: "todo successfully deleted", todo: todo}.to_json]]
        else
          return [404, {"Content-Type" => "application/json"}, [{error: "todo not found."}.to_json]]
        end #if : todo exists
    end
end
end