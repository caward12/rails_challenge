class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :cuisine, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  belongs_to :user
end