# frozen_string_literal: true

class ToggleFollowComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end
end
