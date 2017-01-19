require 'rails_helper'

RSpec.describe EmailJob, type: :job do
  let(:contact) { create :contact }
  subject(:job) { described_class.perform_later(contact) }

  it "queues the job" do
    expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it "is in default queue" do
    expect(EmailJob.new.queue_name).to eq('default')
  end

  it "excutes perform" do
    expect {
      perform_enqueued_jobs { job }
    }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
