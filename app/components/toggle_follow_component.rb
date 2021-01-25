# frozen_string_literal: true

class ToggleFollowComponent < ViewComponent::Base
  include SessionsHelper
  include UsersHelper
  def initialize(user:)
    @user = user
  end
end
