require 'rails_helper'

describe "customers API" do
  it "sends a list of customers" do
      Fabricate.times(3, :customer)

      get '/api/v1/customers'

      expect(response).to be_success

      customers = JSON.parse(response.body)

      expect(customers.count).to eq(3)
  end

  it "can get one customers by id" do
    id = Fabricate(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can search a customer by its id" do
    data_customer = Fabricate(:customer)

    get "/api/v1/customers/find?id=#{data_customer.id}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(data_customer.id)
  end

  it "can search a customer by its first name" do
    data_customer = Fabricate(:customer)

    get "/api/v1/customers/find?first_name=#{data_customer.first_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(data_customer.first_name)
  end

    it "can search a customer by its first name, case insensitive" do
    data_customer = Fabricate(:customer, first_name: "Sweet Sauce")

    get "/api/v1/customers/find?first_name=sweet SAUCE"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq("Sweet Sauce")
  end

  it "can search a customer by its last name" do
    data_customer = Fabricate(:customer)

    get "/api/v1/customers/find?last_name=#{data_customer.last_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["last_name"]).to eq(data_customer.last_name)
  end

  it "can search a customer by its last name, case insensitive" do
    data_customer = Fabricate(:customer, last_name: "Sweet Sauce")

    get "/api/v1/customers/find?last_name=sweet SAUCE"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["last_name"]).to eq("Sweet Sauce")
  end

  xit "can search a customer by the date it was created at" do
    data_customer = Fabricate(:customer)

    get "/api/v1/customers/find?created_at=#{data_customer.created_at}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["created_at"]).to eq(data_customer.created_at)
  end

  xit "can search a customer by the date it was updated at" do
    data_customer = Fabricate(:customer)

    get "/api/v1/customers/find?updated_at=#{data_customer.updated_at}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["updated_at"]).to eq(data_customer.updated_at)
  end
end