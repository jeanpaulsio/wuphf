class WuphfMailer < ApplicationMailer
  default from: 'noreply@wuphf.io'

  def wuphf_mail(demo_wuphf)
    @demo_wuphf = demo_wuphf

    mail(to: @demo_wuphf.email, subject: "WUPHF FROM #{@demo_wuphf.from.upcase}!")
  end
end
