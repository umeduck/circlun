class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :circle_manager
end
