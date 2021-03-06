ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class BMWeb < Sinatra::Base
  get '/' do
    redirect '/sign_up'
  end

  get '/sign_up' do
  erb :'sign_up/sign_up'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/link_new'
  end

  post 'sign_up' do
    redirect '/links'
  end

  post '/new/link' do
    link = Link.new(url: params[:url], title: params[:title])
    @tags = []
    params[:tags].split(' ').each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    @links = Tag.all(name: params[:name]).links
    erb :'links/index'
  end


  run! if app_file == $0
end
