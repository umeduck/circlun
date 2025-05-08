class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :circle
  enum role: { manager: 1, player: 2, trial: 3 }
end
