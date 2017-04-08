# Preview all emails at http://localhost:3000/rails/mailers/wuphf_mailer
class WuphfMailerPreview < ActionMailer::Preview
  def wuphf_mail_preview
    WuphfMailer.wuphf_mail
  end
end
