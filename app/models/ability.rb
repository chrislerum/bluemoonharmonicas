class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    cannot :manage, [User, Order, Faq, Link]
    can :read, Comb
    can :read, Harmonica
    can :read, PowderCoatedCover
    can :read, SubKit
    can [:new, :create, :express], Order, user_id: user.try(:id)

    if user.id
      can :manage, User, id: user.id
      can :read, Order, user_id: user.id
    end
  end
end
