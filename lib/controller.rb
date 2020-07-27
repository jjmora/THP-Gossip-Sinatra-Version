# require 'bundler'  => Inutil si usamos el config.ru
# Bundler.require    => Inutil si usamos el config.ru
require 'gossip'

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
    erb :show, locals: {gossips: Gossip.all}
  end

  #run! if app_file == $0 => Inutil si usamos el config.ru

end