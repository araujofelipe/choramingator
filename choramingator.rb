require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-migrations'
require File.expand_path(File.dirname(__FILE__) + "/models/choramingo.rb")

get '/' do
   @choramingos = Choramingo.all(limit:5).sort_by(&:created_at).reverse
   haml :index
end

configure :development do
  DataMapper.setup(:default, 'postgres://postgres:12345678@localhost/choramingator')
  DataMapper.auto_migrate!
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
	  {'message'=> 'Sucess!', 'nome'=> choramingo.nome, 'choro'=>choramingo.choro, 'id' => choramingo.id}.to_json
	#rescue DataMapper::DocumentNotValid => e
	 # e.exception.to_s
	end	
end

get '/all' do
  @choramingos = Choramingo.all.sort_by(&:created_at).reverse
  haml :all
end
