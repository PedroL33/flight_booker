class PassengerMailMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def thank_you_email
        @passenger = params[:passenger]
        @url  = 'http://localhost:3000/'
        mail(to: @passenger.email, subject: 'Thank you for booking a flight with flight booker.')
    end
end
    