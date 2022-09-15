class ShoppingItemsController < ApplicationController

    # GET: /shopping_items
    get '/shopping_items' do
      ShoppingItem.all.to_json
    end
  
    # POST: /shopping_items
    post '/shopping_items' do
      user = User.find_by(email_address: params[:email_address])
      
      shopping_item = ShoppingItem.new(
        title: params[:title],
        user_id: user.id,
        shopping_category_id: params[:shopping_category_id],
        price: params[:price],
        amount: params[:amount]
      )
      if shopping_item.save
        shopping_item.to_json
      else
        {error: "user not found".to_json}
      end
    end
  
  
    # GET: /shopping_items/5
    get '/shopping_items/:id' do
      if ShoppingItem.find_by_id(params[:id])
        ShoppingItem.find_by_id(params[:id]).to_json
      else
        {error: "Record not found with id #{params['id']}"}.to_json
      end
    end
  
    # PATCH: /shopping_items/5
    patch '/shopping_items/:id' do
      shopping_item = ShoppingItem.find_by_id(params[:id])
      shopping_item.update(
        title: params[:title],
        shopping_category_id: params[:todo_category_id],
        price: params[:price],
        amount: params[:amount]
      )
      shopping_item.to_json
    end
  
    # DELETE: /shopping_items/5/delete
    delete '/shopping_items/:id' do
      shopping_item = ShoppingItem.find_by_id(params[:id])
      if shopping_item
        shopping_item.destroy
        shopping_item.to_json
      else
        {error: "Record not found with id #{params['id']}"}.to_json
      end
    end
  
  end
  
  
  
  
  
  
  
  
  
  
  
  