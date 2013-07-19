class CauseMailer < ActionMailer::Base
  def new_volunteer(cause, volunteer)
    @cause=cause
    @volunteer=volunteer
    mail :subject => "You have a new volunteer",
         :from    => "you@yourdomain.com",
         :to      => to_email
  end

  def new_cash_donation(cause, cash_donation)
    @cause=cause
    @cash_donation=cash_donation
    mail :subject => "You have a new cash donation",
         :from    => "you@yourdomain.com",
         :to      => to_email
  end

  def new_goods_donation(cause, good_donation)
    @cause=cause
    @good_donation=good_donation
    mail :subject => "You have a new good donation",
         :from    => "you@yourdomain.com",
         :to      => to_email
  end

  protected
    def to_email
      if @cause.contact_email &&  !@cause.contact_email.empty?
        @cause.contact_email
      else
        'eddie@meetmantra.com' # will need to change in future
      end
    end

end