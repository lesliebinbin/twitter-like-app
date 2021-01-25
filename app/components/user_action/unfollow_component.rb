class UserAction::UnfollowComponent < ViewComponent::Base
  include SessionsHelper
  include UsersHelper
  def initialize(user:)
    puts 'hh3'
    @user = user
  end
end
