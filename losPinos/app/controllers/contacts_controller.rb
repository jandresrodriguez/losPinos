class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Gracias por su mensaje. Lo estaremos contactando lo antes posible!'
    else
      flash.now[:error] = 'No se pudo enviar el mensaje. Intentelo mas tarde.'
      render :new
    end
  end
end
