ENV["RACK_ENV"] ||= "development"

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

  post '/new_link' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  run! if app_file == $0
end
