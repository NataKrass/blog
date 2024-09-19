module UsersHelper
  require 'digest/md5'

  def gravatar_for(user)
    email_address = user.email.to_s.downcase.strip 
    hash = Digest::MD5.hexdigest(email_address) 
    image_src = "https://www.gravatar.com/avatar/#{hash}" 
    image_tag(image_src, alt: user.username)
  end
end
