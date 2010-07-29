require File.dirname(__FILE__) + "/../choraminga"

 set     :app_file, File.expand_path(File.dirname(__FILE__) + '/../choramingator.rb')
 set     :public,   File.expand_path(File.dirname(__FILE__) + '/../public')
 set     :views,    File.expand_path(File.dirname(__FILE__) + '/../views')
 set	 	:models,   File.expand_path(File.dirname(__FILE__) + '/../models')
 set		:env, :production

 disable :run,      :reload

 run Sinatra::Application
