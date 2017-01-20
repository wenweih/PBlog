require 'rails_helper'
include ActiveJob::TestHelper

RSpec.describe Contact, type: :model do
  let(:contact) { create :contact }

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:message) }
  it { should allow_value("mr.huangwenwei@gmail.com").for(:email) }

  it "send email after create" do
    expect(EmailJob).to receive(:perform_now).with(contact)
  end
end
