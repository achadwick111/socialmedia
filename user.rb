class User < ActiveRecord::Base

	def self.connect_to_linkedin(auth, signed_in_resource=nil)

    user = User.where(:provider => auth.provider, :uid => auth.uid).first
  	if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else

     
	   			user = User.create( email:auth.info.email,
	                         password:Devise.friendly_token[0,20],
				 provider:auth.provider,
				 uid:auth.uid,
				first_name:auth.info.first_name,
				last_name:auth.info.last_name,
				image:auth.info.image,
				phone:auth.info.phone,
				headline:auth.info.headline,
				location:auth.info.location,
			 )
			end
    end
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.uid + "@twitter.com").first
      if registered_user
        return registered_user
      else

        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.uid+"@twitter.com",
                            password:Devise.friendly_token[0,20],
                          )
      end

    end
  end
end
