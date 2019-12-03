require 'json'
require './lib/shorten'
require 'sinatra'

class UrlShortener < Sinatra::Base
	set :urls, Shortener.display_urls
	
	get '/' do
		erb :index
	end
	
	post '/' do
		s = JSON.parse(request.body.read)
		sh = Shortener.shorten(s["url"])
		{ :short_url => sh[0], :url => sh[1] }.to_json
	end
	
	post '/url' do
		sh = Shortener.shorten(params[:url].to_s)
		{ sh[0] => sh[1] }.to_json
		redirect to('/')
	end
	
	get "/:url" do
		redirect to(settings.urls[params[:url]])
	end
	
	run! if app_file == $PROGRAM_NAME
end