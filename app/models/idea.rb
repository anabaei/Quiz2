class Idea < ApplicationRecord
	validates :title, presence: true
	validates :des, presence: true
	belongs_to :user, optional: true
    has_many :review, dependent: :nullify
    has_many :alllike
end
