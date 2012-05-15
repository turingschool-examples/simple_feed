require 'digest/md5'

class User < ActiveRecord::Base
  has_one :feed, inverse_of: :user
  attr_accessible :email, :password, :password_confirmation
  authenticates_with_sorcery!

  validates :username, presence: true, format: /^[\d\w]+$/,length: {minimum: 2, message: "password must be at least 2 characters long"}
  validates_length_of :password, :minimum => 6, :message => "password must be at least 6 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  before_validation :clean_email
  before_create :setup_feed

  def created?(item)
    item.feed == feed
  end

  def gravatar(s='40')
    @gravatar    ||= {}
    @gravatar[s] ||= "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?s=#{s}"
  end

  private

  def setup_feed
    build_feed
    feed.name = username
  end

  def clean_email
    if email.respond_to? :trim
      email.trim!.downcase!
    end
  end
end
