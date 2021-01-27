class UserAction::FollowComponent< ViewComponent::Base
  include SessionsHelper
  include UsersHelper
  def initialize(user:)
    @user = user
  end
end
