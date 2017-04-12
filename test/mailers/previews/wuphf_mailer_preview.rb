# Preview all emails at http://localhost:3000/rails/mailers/wuphf_mailer
class WuphfMailerPreview < ActionMailer::Preview

  # http://localhost:3000/rails/mailers/wuphf_mailer/wuphf_mail_preview
  def wuphf_mail_preview
    demo_wuphf = DemoWuphf.first
    WuphfMailer.wuphf_mail(demo_wuphf)
  end
end
