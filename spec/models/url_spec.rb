require 'rails_helper'

RSpec.describe Url, type: :model do
  it "validates the unqiueness of short hand urls" do
  	Url.create(original: "https://google.com", short: "123456789")
  	@url = Url.new(original: "https://google1.com", short: "123456789")
  	expect(@url.valid?).to eq(false)
  end

  it 'self.add_new creates a url with hash' do 
  	first_count = Url.count
  	Url.add_new("https://google.com")
  	expect(Url.count).to eq(first_count + 1)
  end

  it 'self.generate_hash returns a hash of size 6' do 
  	shorthand = Url.generate_hash
  	expect(shorthand.length).to eq(6)
  end
end
