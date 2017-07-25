class Review < ApplicationRecord
  belongs_to :idea, optional: true
  belongs_to :user, optional: true
  
end
