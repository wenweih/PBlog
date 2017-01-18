require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:contact) { create :contact }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:message) }
  it { should allow_value("mr.huangwenwei@gmail.com").for(:email) }

end
