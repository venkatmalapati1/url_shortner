require 'rails_helper'

RSpec.describe UrlController, type: :controller do
	describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "redirects to correct url for short hand url " do 
    	@url = Url.add_new("https://google.com")
    	get :index, {id: @url.short}
    	expect(response).to redirect_to(@url.original)
    end


    it "render the index template if short hand is not present " do 
    	get :index, {id: "123456789"}
    	expect(response).to render_template("index")
    end
  end


  describe "get NEW" do 
  	it 'render new template' do 
  		get :new
  		expect(response).to render_template('new')
  	end
  end

  describe "POST CREATE" do 
  	it "render show page " do 
  		post :create, {new_url: "https://google.com"}
  		expect(response).to redirect_to(url_path(Url.last))
  	end 

  	it 'creates the new url' do 
  		post :create , {new_url: "https://google.com"}
  		expect(Url.last.original).to eq("https://google.com")
  	end

  	it "doesnt create url if params is not present" do 
  		post :create
  		expect(Url.last).to eq(nil)
  	end
  end
end
