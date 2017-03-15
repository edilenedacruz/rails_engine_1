class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :payments, through: :invoices
  has_many :customers, through: :invoices

  validates :name, presence: true
end
