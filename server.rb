require 'sinatra'
require 'httparty'

  get '/' do
  	response = HTTParty.get('http://api.yummly.com/v1/api/recipes?_app_id=d685cd6d&_app_key=aef96aecda59fbbee1db452d55c98d83&chocolate')
    puts response.body.inspect
  end 
  

