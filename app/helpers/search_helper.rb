module SearchHelper
	def search_url_generator(type, *options)
		case type.to_s
		when "cat"
			@url_data[:cat] = options.first
		when "prop"
			puts "==00== #{options}--->#{@url_data}"
			@url_data[:prop] ||= {}
			@url_data[:prop][options.first.to_s.to_sym] = options.last
		end

		puts "=========#{@url_data} ==========="

		props = @url_data[:prop].map do |key, value|
			"#{key}:#{value}"
		end.join('%3B')
		props = "&prop=" << props

		"/search?cat=#{@url_data[:cat]}#{props}"
	end
end
