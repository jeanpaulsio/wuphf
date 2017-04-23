class RecipientPresenter < BasePresenter
  presents :recipient

  def name
    recipient.name
  end

  def email
    recipient.email
  end

  def phone
    recipient.phone
  end

  def twitter_handle
    if recipient.twitter_handle.present?
      "@#{recipient.twitter_handle}"
    else
      content_tag :em, "n/a", class: "none"
    end
  end
end
