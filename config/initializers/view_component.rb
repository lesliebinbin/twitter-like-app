[SessionsHelper, UsersHelper].each do |helper_module|
  ViewComponent::Base.include(helper_module)
end
