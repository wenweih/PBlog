class ContactsController < ApplicationController

  def create
    message = Contact.new(contact_params)

    respond_to  do  |format|
      if message.save
        format.html { redirect_to root_path,  notice: "消息发送成功" }
        format.js
      else
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
