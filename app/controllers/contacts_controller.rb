class ContactsController < ApplicationController

  def create
    message = Contact.new(contact_params)
    if message.save
      redirect_to root_pathm notice: '成功发送信息，我看到信息将马上回复您，感谢，祝您生活愉快!'
    else
      redirect_to root_path, notice: "#{message.errors.full_messages}"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
