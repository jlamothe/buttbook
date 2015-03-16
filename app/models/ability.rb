class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    can :manage, :all if @user.admin
    can [:index, :show], :all if @user.persisted?
    user_permissions
  end

protected

  def user_permissions
    can [:edit, :update, :delete], User, id: @user.id if @user.persisted?
  end
end
