# require 'bundler'  => Inutil si usamos el config.ru
# Bundler.require    => Inutil si usamos el config.ru
require 'gossip'
#require 'comment'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/new/'do
    erb :new_gossip
  end

  get '/gossips/:id' do
    erb :show, locals: {gossips: Gossip.find(params['id']), gossips_id: params['id']}
  end

  post '/:id/edit/' do
    Gossip.update(params["gossip_id"], params["gossip_author"],params["gossip_content"])
    redirect '/'
  end

  get '/:id/edit/' do
    erb :edit, locals: {gossips: Gossip.find(params['id']), gossips_id: params['id']}
  end

  # post '/gossips/:id/' do
  #   Comment.new(params["comment_content"], params["gossip_id"]).save
  #   redirect '/'
  # end

  #run! if app_file == $0 => Inutil si usamos el config.ru

end