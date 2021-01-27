# frozen_string_literal: true

class ToggleFollowComponent < ViewComponent::Base

  extend Forwardable
  def_delegators :controller, *%i[cookies]
  def initialize(user:)
    @user = user
  end
end
