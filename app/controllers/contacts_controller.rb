class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = I18n.t('contact.message_success')
      redirect_to root_path
    else
      flash.now[:error] = I18n.t('contact.message_error')
      render :new
    end
  end
end
