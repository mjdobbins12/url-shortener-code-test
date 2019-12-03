class Shortener
	@urls = {}
	
	def self.shorten(url)
		short_url = ('a'..'z').to_a.sample(8).join
		if !url.start_with? "http"
			url = "http://" + url
		end
		@urls[short_url] = url
		[short_url, url]
	end
	
	def self.display_urls
		@urls
	end
end