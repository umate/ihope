class User < ActiveRecord::Base
  extend Enumerize
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  enumerize :role, in: [:admin, :moderator, :user]
  delegate :admin?, :moderator?, :user?, to: :role, allow_nil: true
end
