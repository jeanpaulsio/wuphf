class WuphfMailer < ApplicationMailer
  default from: 'wuphfwuphfwuphf@gmail.com'

  def wuphf_mail(demo_wuphf)
    @demo_wuphf = demo_wuphf

    mail(to: @demo_wuphf.email, subject: "Wuphf Wuphf! You have a WUPHF!")
  end
end
