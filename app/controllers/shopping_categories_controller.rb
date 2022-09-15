class ShoppingCategoriesController < ApplicationController

    # GET: /shopping_categories
    get '/shopping_categories' do
      ShoppingCategory.all.to_json
    end
  
    # POST: /shopping_categories
    post '/shopping_categories' do
      ShoppingCategory.create(name: params[:name]).to_json
    end
  
    # GET: /shopping_categories/5
    get '/shopping_categories/:id' do
      if ShoppingCategory.find_by_id(params[:id])
        ShoppingCategory.find_by_id(params[:id]).to_json
      else
        {error: "Record not found with id #{params['id']}"}.to_json
      end
    end
  
    # PATCH: /shopping_categories/5
    patch '/shopping_categories/:id' do
      shopping_category = ShoppingCategory.find_by_id(params[:id])
      shopping_category.update(name: params[:name])
      shopping_category.to_json
    end
  
    # DELETE: /shopping_categories/5/delete
    delete '/shopping_categories/:id' do
      shopping_category = ShoppingCategory.find_by_id(params[:id])
      if shopping_category
        shopping_category.destroy
        shopping_category.to_json
      else
        {error: "Record not found with id #{params['id']}"}.to_json
      end
    end
  end