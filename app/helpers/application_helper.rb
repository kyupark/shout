# require 'digest/md5'
module ApplicationHelper
  def gravatar(user, size = 40)
    hash = Digest::MD5.hexdigest(user.email)
    image_tag "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
  end
end
