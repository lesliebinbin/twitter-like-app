# frozen_string_literal: true

class CustomPostComponent < ViewComponent::Base
  include SessionsHelper
  include UsersHelper
  with_collection_parameter :post
  def initialize(post:)
    @post = post
  end
end
