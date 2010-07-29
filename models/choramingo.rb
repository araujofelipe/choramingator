require 'rubygems'
require 'mongo'
require 'mongo_mapper'

class Choramingo
	include MongoMapper::Document
  
  key :nome, String
  key :choro, String , :required => true
  key :created_at, Time

  def retira_palavroes 
		palavroes = ['cu' => 'ceu', 'porra' => 'poxa', 'caralho' => 'baralho', 'buceta' => 'lambreta', 'puta' => 'fruta', 'pariu' => 'caiu', 'foda' => 'bom'
						,'carai' => 'barai', 'caraio' => 'baraio', 'cú' => 'céu']		
		self.choro.split(' ').each do |f|
			palavroes[0].each do |p|
				if p[0] == f
						self.choro = self.choro.gsub(p[0],p[1])		
				end
			end			
		end
  end
	

end
