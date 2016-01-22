require 'sinatra/base'
require_relative 'till'

class App < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/public'
  # include ViewHelpers

  get '/' do
    @till = Till.new
    erb :index
  end
end
