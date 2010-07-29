require 'rubygems'
require 'sinatra'
require 'mongo'
require 'mongo_mapper'
require File.expand_path(File.dirname(__FILE__) + "/models/choramingo.rb")

get '/' do
   @choramingos = Choramingo.all.sort_by(&:created_at).reverse
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
	  choramingo = Choramingo.create({:nome => params[:nome], :choro => params[:choro], :created_at => Time.now})
	  if choramingo.nome== '' 
	  	choramingo.nome= 'Anonimo'
	  end
	  choramingo.retira_palavroes
	begin
	  choramingo.save!
	  'Sucess!'
	rescue MongoMapper::DocumentNotValid => e
	  e.exception.to_s
	end	
end

get '/all' do
  @choramingos = Choramingo.all.sort_by(&:created_at).reverse
  haml :all
end
