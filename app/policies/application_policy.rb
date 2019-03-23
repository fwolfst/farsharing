class ApplicationPolicy < ActionPolicy::Base
  authorize :user, through: :current_user, allow_nil: true
end
