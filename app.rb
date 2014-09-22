require 'sinatra'
require 'slim'

class App < Sinatra::Base
  register Sinatra::Reloader

  get '/' do
    @link = ""
    @code = ""
    slim :index
  end

  post '/' do
    @link = @params[:link]

    @link = @link[@link.index(":")+1..@link.size]
    @link.gsub!("youtu.be","www.youtube.com/embed")

    @code = "<iframe width=\"560\" height=\"315\" src=\"" + @link + "\" frameborder=\"0\" allowfullscreen></iframe>"

    slim :index
  end
end
