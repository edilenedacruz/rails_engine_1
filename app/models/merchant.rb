class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  validates :name, :created_at, :updated_at, presence: true
end
