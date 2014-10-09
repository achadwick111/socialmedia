class SocialController < ApplicationController
	def product_detail
		@d=Product.find_by_id(params[:product])

		if cookies[:recently_view].nil? then 
			cookies[:recently_view]=""
		end
    if cookies[:recently_view].index(params[:product]) == nil then 
			cookies[:recently_view]=params[:product].to_s+" "+ cookies[:recently_view].to_s
		else
			cookies[:recently_view]=cookies[:recently_view].delete( params[:product].to_s)
			cookies[:recently_view]=cookies[:recently_view].squish
			cookies[:recently_view]=params[:product].to_s+" "+ cookies[:recently_view].to_s
		end	
	end
end
