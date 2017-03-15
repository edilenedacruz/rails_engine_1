require 'rails_helper'

describe "InvoiceItems API" do
  it "creates a list of all invoice items" do
    Fabricate.times(10, :invoice_item)

    get '/api/v1/invoice_items.json'

    expect(response).to be_success
    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(10)
  end

  it "can get one invoice item by its id" do
    id = Fabricate(:invoice_item).id

    get "/api/v1/invoice_items/#{id}.json"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end

  it "can search an invoice item by its id" do
    data_invoice_item = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/find?id=#{data_invoice_item.id}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(data_invoice_item.id)
  end

  it "can search an invoice item by its item id" do
    data_invoice_item = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/find?item_id=#{data_invoice_item.item_id}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["item_id"]).to eq(data_invoice_item.item_id)
  end

  it "can search an invoice item by its invoice id" do
    data_invoice_item = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/find?invoice_id=#{data_invoice_item.invoice_id}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["invoice_id"]).to eq(data_invoice_item.invoice_id)
  end

  it "can search an invoice item by its quantity" do
    data_invoice_item = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/find?quantity=#{data_invoice_item.quantity}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["quantity"]).to eq(data_invoice_item.quantity)
  end

  it "can search an invoice item by its unit price" do
    data_invoice_item = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/find?unit_price=#{data_invoice_item.unit_price}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["unit_price"]).to eq(data_invoice_item.unit_price)
  end

  xit "it can search an invoice item by the date it was created at" do
    data_invoice_item = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/find?created_at=#{data_invoice_item.created_at}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(invoice_item["created_at"]).to eq(data_invoice_item.created_at)
  end

  xit "it can search an invoice item by the date it was updated at" do
    data_invoice_item = Fabricate(:invoice_item)

    get "/api/v1/invoice_items/find?updated_at=#{data_invoice_item.updated_at}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(invoice_item["updated_at"]).to eq(data_invoice_item.updated_at)
  end

  it "can find all invoice items by item id" do
    item = Fabricate(:item)
    data_invoice_item_1, data_invoice_item_2 = Fabricate.times(2, :invoice_item, item_id: item.id)

    get "/api/v1/invoice_items/find_all?item_id=#{data_invoice_item_1.item_id}"

    expect(response).to be_success

    invoice_item_1 = JSON.parse(response.body).first

    expect(invoice_item_1["item_id"]).to eq(data_invoice_item_1.item_id)
  end

  it "can find all invoice items by invoice id" do
    invoice = Fabricate(:invoice)
    data_invoice_item_1, data_invoice_item_2 = Fabricate.times(2, :invoice_item, invoice_id: invoice.id)

    get "/api/v1/invoice_items/find_all?invoice_id=#{data_invoice_item_1.invoice_id}"

    expect(response).to be_success

    invoice_item_1 = JSON.parse(response.body).first

    expect(invoice_item_1["invoice_id"]).to eq(data_invoice_item_1.invoice_id)
  end

  it "can find all invoice items by quantity" do
    data_invoice_item_1, data_invoice_item_2 = Fabricate.times(2, :invoice_item)

    get "/api/v1/invoice_items/find_all?quantity=#{data_invoice_item_1.quantity}"

    expect(response).to be_success

    invoice_item_1 = JSON.parse(response.body).first

    expect(invoice_item_1["quantity"]).to eq(data_invoice_item_1.quantity)
  end

  it "can find all invoice items by unit price" do
    data_invoice_item_1, data_invoice_item_2 = Fabricate.times(2, :invoice_item)

    get "/api/v1/invoice_items/find_all?unit_price=#{data_invoice_item_1.unit_price}"

    expect(response).to be_success

    invoice_item_1 = JSON.parse(response.body).first

    expect(invoice_item_1["unit_price"]).to eq(data_invoice_item_1.unit_price)
  end
end
