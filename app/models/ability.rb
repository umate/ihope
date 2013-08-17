class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :dashboard
      can :access, :rails_admin
      can :manage, :all
    elsif user.user?

    else

    end
  end
end
