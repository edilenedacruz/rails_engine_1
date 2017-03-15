require 'rails_helper'

describe "Items API" do
  it "creates a list of items" do
    Fabricate.times(5, :item)

    get '/api/v1/items.json'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(5)
  end

  it "can get one item by its id" do
    id = Fabricate(:item).id

    get "/api/v1/items/#{id}.json"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "can search an item by its id" do
    data_item = Fabricate(:item)

    get "/api/v1/items/find?id=#{data_item.id}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(data_item.id)
  end

  it "can search an item by its name" do
    data_item = Fabricate(:item)

    get "/api/v1/items/find?name=#{data_item.name}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(data_item.name)
  end

  xit "can search an item by its description" do
    data_item = Fabricate(:item)

    get "/api/v1/items/find?description=#{data_item.description}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["description"]).to eq(data_item.description)
  end

  it "can search an item by its unit price" do
    data_item = Fabricate(:item)

    get "/api/v1/items/find?unit_price=#{data_item.unit_price}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["unit_price"]).to eq(data_item.unit_price)
  end

  it "can search an item by its merchant_id" do
    data_item = Fabricate(:item)

    get "/api/v1/items/find?merchant_id=#{data_item.merchant_id}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["merchant_id"]).to eq(data_item.merchant_id)
  end

  xit "can search an item by the date it was created at" do
    data_item = Fabricate(:item)

    get "/api/v1/items/find?created_at=#{data_item.created_at}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item["created_at"]).to eq(data_item.created_at)
  end

  xit "can search an item by the date it was updated at" do
    data_item = Fabricate(:item)

    get "/api/v1/items/find?updated_at=#{data_item.updated_at}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item["updated_at"]).to eq(data_item.updated_at)
  end

  it "can find all items by name" do
    data_item_1, data_item_2 = Fabricate.times(2, :item)

    get "/api/v1/items/find_all?id=#{data_item_1.id}"

    expect(response).to be_success

    item_1 = JSON.parse(response.body).first

    expect(item_1["id"]).to eq(data_item_1.id)
  end

  it "can find all items by name" do
    data_item_1, data_item_2 = Fabricate.times(2, :item)

    get "/api/v1/items/find_all?name=#{data_item_1.name}"

    expect(response).to be_success

    item_1 = JSON.parse(response.body).first

    expect(item_1["name"]).to eq(data_item_1.name)
  end

  it "can find all items by description" do
    data_item_1, data_item_2 = Fabricate.times(2, :item)

    get "/api/v1/items/find_all?description=#{data_item_1.description}"

    expect(response).to be_success

    item_1 = JSON.parse(response.body).first

    expect(item_1["description"]).to eq(data_item_1.description)
  end

  it "can find all items by unit price" do
    data_item_1, data_item_2 = Fabricate.times(2, :item)

    get "/api/v1/items/find_all?unit_price=#{data_item_1.unit_price}"

    expect(response).to be_success

    item_1 = JSON.parse(response.body).first

    expect(item_1["unit_price"]).to eq(data_item_1.unit_price)
  end

  it "can find all items by merchant id" do
    merchant = Fabricate(:merchant)
    data_item_1, data_item_2 = Fabricate.times(2, :item, merchant: merchant)

    get "/api/v1/items/find_all?merchant_id=#{data_item_1.merchant_id}"

    expect(response).to be_success

    item_1 = JSON.parse(response.body).first

    expect(item_1["merchant_id"]).to eq(data_item_1.merchant_id)
  end
end
