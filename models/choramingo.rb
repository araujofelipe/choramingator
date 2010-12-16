require 'rubygems'
require 'dm-core'
require 'dm-migrations'
require File.expand_path(File.dirname(__FILE__) + "/../db/palavras_feias.rb")

class Choramingo
	include DataMapper::Resource
  
  property :id, Serial
  property :nome, String
  property :choro, Text , {:required => true}
  property :created_at, Time

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

