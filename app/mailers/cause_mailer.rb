class CauseMailer < ActionMailer::Base
  def new_volunteer(cause, volunteer)
    @cause=cause
    @volunteer=volunteer
    mail :subject => "You have a new volunteer",
         :from    => "you@yourdomain.com",
         :to      => @cause.contact_email
  end

  def new_cash_donation(cause, cash_donation)
    @cause=cause
    @cash_donation=cash_donation
    mail :subject => "You have a new cash donation",
         :from    => "you@yourdomain.com",
         :to      => @cause.contact_email
  end

  def new_good_donation(cause, good_donation)
    @cause=cause
    @good_donation=good_donation
    mail :subject => "You have a new good donation",
         :from    => "you@yourdomain.com",
         :to      => @cause.contact_email
  end

end