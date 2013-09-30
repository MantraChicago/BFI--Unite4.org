class CustomerIoDeviseMailer < Devise::Mailer
  include Devise::Mailers::Helpers


  def confirmation_instructions(record, token, opts={})
    @token = token
    #devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, token, opts={})
    token=record.reset_password_token # idk why token is an empty array
    base_url= 'http://unite4.org/' #might need to make more dynamic
    reset_link= "#{base_url}users/password/edit/?reset_password_token=#{token}"
    $customerio_user.track(record.customer_io_id, "password_retrieval", {reset_link:reset_link})
  end

  def unlock_instructions(record, token, opts={})
    @token = token
    #devise_mail(record, :unlock_instructions, opts)
  end
end

