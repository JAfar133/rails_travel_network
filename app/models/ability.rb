class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role == 'agent'
      can :manage, :all
    elsif user.role == 'user'
      can :read, :all
      can :add_to_favorites, TravelPlace
    end
  end
end
