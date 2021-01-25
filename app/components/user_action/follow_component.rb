class UserAction::FollowComponent< ViewComponent::Base
  include SessionsHelper
  include UsersHelper
  def initialize(user:)
    puts 'hh2'
    @user = user
  end
end
