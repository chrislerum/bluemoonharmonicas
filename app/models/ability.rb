class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Admin
    if user.admin?
      can :manage, :all

    # Guests and registered users
    else
      cannot :manage, [User, Order, Faq, Link]
      can :read, Item
      can [:new, :create, :express], Order, user_id: user.try(:id)
    end

    # Registered user
    if user.id
      can :manage, User, id: user.id
      can :read, Order, user_id: user.id
    end
  end
end
