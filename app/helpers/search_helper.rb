module SearchHelper
	def search_url_generator(type, *options)
		case type.to_s
		when "cat"
			@url_data[:cat] = options.first
		when "prop"
			@url_data[:prop] ||= {}
			@url_data[:prop][options.first.to_s.to_sym] = options.last
		end

		props = @url_data[:prop].map do |key, value|
			"#{key}:#{value}"
		end.join(';')
		props = "&prop=" << props
		"/search?cat=#{@url_data[:cat]}#{props}"
	end
end
