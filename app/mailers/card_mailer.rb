class CardMailer < ApplicationMailer
    default from: 'notifications@example.com'
    def new_card_email(user)
        @user = user
        mail(to: @user.email, subject: "You got a new Card!")
    end

    def update_card_email(user)  
        @user = user
        mail(to: @user.email, subject: "You got a new Card!")
    end

    def delete_card_email(user)
        @user = user
        mail(to: @user.email, subject: "You got a new Card!")
    end

end