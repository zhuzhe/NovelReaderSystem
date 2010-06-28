require "digest/sha1"


class Account < ActiveRecord::Base
  has_and_belongs_to_many :novels
  belongs_to :group
  has_many :comments
#  validates_format_of  :email,:with =>/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,:message=>' email is not correct'
 validates_presence_of :original_pwd,:on=>:create
 validates_confirmation_of :original_pwd,:on=>:create
  attr_accessor :original_pwd_confirmation

 def self.encrypted_pwd(pwd)
    Digest::SHA1.hexdigest(pwd)
 end

def original_pwd
  @original_pwd
end

def original_pwd=(pwd)
  @original_pwd=pwd
  return if pwd.blank?
  self.pwd=Account.encrypted_pwd(pwd)
end

def self.authenticate(email,pwd)
  account=Account.first(:conditions=>{:email=>email})
  if account
    expected_password=self.encrypted_pwd(pwd)
    if expected_password!=account.pwd
      account=nil
    end
  end
  account
 end



end
