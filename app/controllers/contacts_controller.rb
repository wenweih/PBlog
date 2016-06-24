class ContactsController < ApplicationController

  def create
    message = Contact.new(contact_params)
    if message.save
      render :json =>{:success=>true}
    else
      render :json =>{:success=>false}
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
