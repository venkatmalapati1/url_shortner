class Url < ActiveRecord::Base

  	validates_uniqueness_of :short
  	
  	validates_presence_of :original
  	
	def self.add_new url
		Url.create(original: url, short: Url.generate_hash)
	end


	def self.generate_hash
		length = 6
		shorthand = rand(36**length).to_s(36)
		@url = Url.where(short: shorthand).first
		if @url
			generate_hash
		else
			return shorthand
		end
	end
end
