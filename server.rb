require 'sinatra'
require 'httparty'

  get '/' do
  	erb :index
  end 
  
  post '/foodly' do
  	ingredients = params["allowedIngredients"].first.split
  	base_url = "http://api.yummly.com/v1/api/recipes?_app_id=d685cd6d&_app_key=aef96aecda59fbbee1db452d55c98d83&requirePictures=true"
  	ingredients.each {|ingredient| base_url << ("&allowedIngredient=" + ingredient)} 
  	response = HTTParty.get(base_url)
  	@data = JSON.parse(response.body)
  	erb :recipe
  end 

  get '/recipe' do 
  	
  end 
	