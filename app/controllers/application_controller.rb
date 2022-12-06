class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes

    get '/bakeries' do 
      # get all the bakeries from the database
      bakeries = Bakery.all
      # send them back as a JSON array
      bakeries.to_json
    end

    get '/bakeries/:id' do

      bakery = Bakery.find(params[:id])
      bakery.to_json(include: :baked_goods)

    end

    get '/baked_goods/by_price' do 
      # see the BakedGood class for the method definition `.by_price`
      baked_goods = BakedGood.by_price 
      baked_goods.to_json
    end

    get '/baked_goods/most_expensive' do
      # see the BakedGood class for the method definition `.by_price
      baked_good = BakedGood.by_price.first
      baked_good.to_json
    end
  

end
