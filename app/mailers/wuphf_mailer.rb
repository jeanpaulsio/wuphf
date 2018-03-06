class WuphfMailer < ApplicationMailer
  default from: 'noreply@wuphfwuphf.herokuapp.com/'

  def wuphf_mail(wuphf)
    @email   = wuphf[:email]
    @message = wuphf[:message]
    @from    = wuphf[:from]

    mail(to: @email, subject: "MESSAGE FROM #{@from.upcase}!")
  end
end
