class ChangeUnitPriceForInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    change_column :invoice_items, :unit_price, :decimal
  end
end
