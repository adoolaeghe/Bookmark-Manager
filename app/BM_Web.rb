require 'sinatra/base'
require_relative 'models/link'

class BMWeb < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/link_new' do
    erb :'links/link_new'
  end

  run! if app_file == $0
end
