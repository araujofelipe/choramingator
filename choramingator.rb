require 'rubygems'
require 'sinatra'
require 'mongo'
require 'mongo_mapper'
require File.expand_path(File.dirname(__FILE__) + "/models/choramingo.rb")

get '/' do
   @choramingos = Choramingo.all({limit:4}).sort_by(&:created_at).reverse
   haml :index
end

configure :development do
	MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
	MongoMapper.database = 'choramingador'
end

get '/about' do 
	'Esse site foi feito apenas para desabafar.  Est&aacute; sob lincensa CreativeCommons e inclusive o CSS foi copiado de http://descertificador.heroku.com'
end

post '/chora' do
  choramingo = Choramingo.new
  choramingo.nome= params[:nome]
  
  if choramingo.nome == '' 
  	choramingo.nome= 'Anonimo'
  end
  
  choramingo.choro= params[:choro]
  choramingo.retira_palavroes
  choramingo.created_at= Time.now
  choramingo.save
  choramingo.to_json
end

get '/all' do
  @choramingos = Choramingo.all.sort_by(&:created_at).reverse
  haml :all
end