# frozen_string_literal: true

class CustomUserComponent < ViewComponent::Base
  include SessionsHelper
  include UsersHelper
  with_collection_parameter :user

  def initialize(user:)
    @user = user
  end
end
