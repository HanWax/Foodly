require 'sinatra'
require 'httparty'
require 'uri'

  get '/' do
  	erb :index
  end 
  
  post '/foodly' do
  	ingredients = params["allowedIngredients"].first.split
    allergy = params["allergies"]
    diet = params["diet"]
  	base_url = "https://api.yummly.com/v1/api/recipes?_app_id=d685cd6d&_app_key=aef96aecda59fbbee1db452d55c98d83&requirePictures=true" << ("&allowedAllergy=" + allergy) << ("&allowedDiet=" + diet)
    ingredients.each {|ingredient| base_url << ("&allowedIngredient=" + ingredient)} 
    url = URI.parse(URI.encode(base_url.strip))
  	response = HTTParty.get(url)
  	@data = JSON.parse(response.body)
  	erb :recipe
  end 

  get '/recipe' do 
    erb :recipe
  end 

