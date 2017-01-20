require 'rails_helper'

RSpec.describe EmailJob, type: :job do

  before { ActionMailer::Base.deliveries.clear }

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

  let(:contact) { create :contact }
  subject(:job) { described_class.perform_later(contact) }

  it "queues the job" do
    expect { job }.to have_enqueued_job(EmailJob)
    # expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it "is in default queue" do
    expect{ job }.to have_enqueued_job.on_queue("default")
  end

  it "excutes perform" do
    expect {
      perform_enqueued_jobs { job }
    }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end
end
