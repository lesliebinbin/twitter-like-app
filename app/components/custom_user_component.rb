# frozen_string_literal: true

class CustomUserComponent < ViewComponent::Base
  attr_reader :user
  with_collection_parameter :user

  def initialize(user:)
    @user = user
  end
end
