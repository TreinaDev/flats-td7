class PropertyReservationMailer < ApplicationMailer

  def notify_new_reservation
    @reservation = params[:reservation]
    @owner =  @reservation.property.property_owner
    mail(to: @owner.email,
         subject: "Nova reserva para seu imóvel")
  end

end