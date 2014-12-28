class User < ActiveRecord::Base


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      name = auth.info.name
      user.first_name = name.split.first
      user.last_name = ''
      unless name.split.length < 2
        user.last_name = name.split.last
      end
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
