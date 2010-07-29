require 'rubygems'
require File.expand_path(File.dirname(__FILE__) + "/../choramingator")
require 'spec'
require 'rack/test'
require 'test/unit'

class ChoramingatorTest < Test::Unit::TestCase


	describe 'The Fala Ai App' do
	  include Rack::Test::Methods

	  def app
		 Sinatra::Application
	  end

	  it "visit index" do
		 get '/'
		 last_response.should be_ok
	  end
	  
	  it "visit all" do
      get '/all'
      last_response.should be_ok
    end

	  it "cria choro" do
		# browser = Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))
		# post '/falatu'
		# falatorio = Falatorio.new
		# falatorio.nome = 'value for nome'
		# falatorio.texto = 'value for texto'
		# browser.get '/'
		# assert browser.last_response.body.include?(falatorio.texto)
	  end

	  it "verifica palavroes" do
			choramingo = Choramingo.new
			choramingo.choro= 'porra caralho mano vai tomar no cu buceta'
			choramingo.retira_palavroes
			choramingo.choro.should == 'poxa baralho mano vai tomar no ceu lambreta'
     end

	end
    

end
