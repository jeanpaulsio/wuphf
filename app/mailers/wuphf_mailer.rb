class WuphfMailer < ApplicationMailer
  default from: 'noreply@wuphf.io'

  def wuphf_mail(wuphf)
    @wuphf = wuphf

    mail(to: @wuphf.email, subject: "WUPHF FROM #{@wuphf.from.upcase}!")
  end
end
