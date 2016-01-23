require "sinatra/base"
require "json"
require_relative 'till'


class App < Sinatra::Base
  use Rack::Session::Pool
  # set :public_folder, File.dirname(__FILE__) + '/public'

  get '/' do
    session[:till] = Till.new
    File.read('lib/views/index.html')
  end

  get '/getData' do
    # Till.new.to
  end

  post '/new' do
    # till = session[:till]
    @till = Till.new
    params.merge! JSON.parse(request.env["rack.input"].read)
    p params[:route]
    p params[:input]
    # meth = params[:route]
    input = params[:input]
    p @till.send(:"#{params[:route]}", params[:input])
  end

  run! if app_file == $0
end
