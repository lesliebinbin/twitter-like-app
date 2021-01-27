# frozen_string_literal: true

class CustomPostComponent < ViewComponent::Base
  extend Forwardable
  attr_reader :post

  with_collection_parameter :post
  def initialize(post:)
    @post = post
  end

  def_delegators :post, *%i[id user display_image image created_at]
  def_delegators :controller, *%i[cookies]
end
