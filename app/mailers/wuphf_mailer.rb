class WuphfMailer < ApplicationMailer
  default from: 'wuphfwuphfwuphf@gmail.com'

  def wuphf_mail(demo_wuphf)
    @demo_wuphf = demo_wuphf

    mail(to: "sio.jeanpaul@gmail.com", subject: "wuphf wuphf!")
  end
end
