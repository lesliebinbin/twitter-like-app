class UserAction::UnfollowComponent < ViewComponent::Base
  include SessionsHelper
  include UsersHelper
  def initialize(user:)
    @user = user
  end
end
