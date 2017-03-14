require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { should belong_to(:invoice) }

  it { should validate_presence_of(:invoice_id)                  }
  it { should validate_presence_of(:credit_card_number)          }
  it { should validate_presence_of(:credit_card_expiration_date) }
  it { should validate_presence_of(:result)                      }
  it { should validate_presence_of(:created_at)                  }
  it { should validate_presence_of(:updated_at)                  }
end
