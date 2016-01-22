require "sinatra/base"
require "json"
require_relative 'till'

class App < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/public'

  get '/' do
    File.read('lib/views/index.html')
  end

  get '/getData' do
    Till.new.to

  end
end
