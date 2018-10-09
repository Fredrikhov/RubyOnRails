class User < ApplicationRecord
  before_create :confirmation_token

  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :email

def email_activate
   self.email_con = true
   self.confirm_token = nil
   save!(:validate => false)
 end

 private
 def confirmation_token
   if self.confirm_token.blank?
     self.confirm_token = SecureRandom.urlsafe_base64.to_s
   end
 end
end
