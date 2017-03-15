require 'rails_helper'

RSpec.describe Payment, type: :model do
  context "relationships" do
    it { should belong_to(:invoice) }
  end
  context "validations" do
    it { should validate_presence_of(:invoice_id)                  }
    it { should validate_presence_of(:credit_card_number)          }
    it { should validate_presence_of(:result)                      }
    xit { should validate_presence_of(:created_at)                 }
    xit { should validate_presence_of(:updated_at)                 }
  end
end
