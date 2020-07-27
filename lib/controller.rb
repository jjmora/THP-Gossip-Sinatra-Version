# require 'bundler'  => Inutil si usamos el config.ru
# Bundler.require    => Inutil si usamos el config.ru

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/gossips/new/'do
    erb :new_gossip
  end

  

  #run! if app_file == $0 => Inutil si usamos el config.ru
end