class WuphfMailer < ApplicationMailer
  default from: 'noreply@wuphf.io'

  def wuphf_mail(wuphf)
    @email   = wuphf[:email]
    @message = wuphf[:message]
    @from    = wuphf[:from]

    mail(to: @email, subject: "WUPHF FROM #{@from.upcase}!")
  end
end
