require 'rubygems'
require 'mongo'
require 'mongo_mapper'
require File.expand_path(File.dirname(__FILE__) + "/../db/palavras_feias.rb")

class Choramingo
	include MongoMapper::Document
  
  key :nome, String
  key :choro, String , {:required => true}
  key :created_at, Time

  def retira_palavroes 
	  palavroes = PalavrasFeias.all
		self.choro.split(' ').each do |f|
			palavroes[0].each do |p|
				if p[0] == f
						self.choro = self.choro.gsub(p[0],p[1])		
				end
			end			
		end
  end
	

end
