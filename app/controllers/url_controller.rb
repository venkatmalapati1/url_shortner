class UrlController < ApplicationController
	def new 
	end

	def show
		@url = Url.where(params[:id]).first
	end

	def index
		@url = Url.where(short: params[:id]).first
		if @url
			redirect_to @url.original
		end
	end

	def create
		if params[:new_url]
			@url = Url.add_new(params[:new_url])
			  respond_to do |format|
			    format.html {redirect_to url_path(@url)}
			    format.json {render json: @url}
			  end
		else
			respond_to do |format|
		    format.html {render "new"}
		    format.json {render json: "invalid data "}
		  end
		end
	end
end
