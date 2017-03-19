class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, :description, :unit_price, :merchant_id, presence: true

  def self.most_revenue(quantity)
    joins(invoices: [invoice_items: :payments]).merge(Payment.success).group(:id).order('sum (invoice_items.quantity * invoice_items. unit_price) desc ').limit(quantity)
  end

  def self.most_items(quantity)
    joins(invoices: [invoice_items: :payments]).merge(Payment.success).group(:id).order('count(invoice_items.quantity) desc ').limit(quantity)
  end

  def best_day
    invoices.joins(:invoice_items).group(:id).order('sum(invoice_items.quantity) desc, invoices.created_at desc ').first.created_at
  end
end
