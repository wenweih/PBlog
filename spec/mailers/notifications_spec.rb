require "rails_helper"

RSpec.describe NotificationsMailer, type: :mailer do

  let(:contact) { create(:contact) }

  describe "contact" do
    let(:mail) { NotificationsMailer.contact contact }

    it "renders the headers" do
      expect(mail.subject).to eq("contact message")
      expect(mail.to).to eq(["mr.huangwenwei@gmail.com"])
      expect(mail.from).to eq(["mr.huangwenwei@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(contact.message)
    end
  end

end
