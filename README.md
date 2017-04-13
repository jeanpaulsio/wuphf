# WUPHF - Whenever. Wherever.

Inspired by [NBC's The Office](http://www.nbc.com/the-office)

This is an open-source toy app to annoy your friends. The live demo can be viewed [here](http://www.wuphf.io/). The goal is to eventually create user sign-ups so that a registered user can save friends to their **dog pack**. Wuphf'ing a member of your dog pack will be easier than manually entering recipient information every time.

## Sending a Wuphf from the landing page

Currently, Wuphf'ing from the landing page will:

* Send the recipient an email via SendGrid
* Send the recipient a text message via Twilio
* Post a tweet with an @ mention of the recipient's twitter handle to the [Wuphf's twitter page](https://twitter.com/wuphfwuphf)

## TODO

* Create User Registrations (w/ OAuth)
  - a registered user can create a `friend` object that they may send wuphfs too
  - a registered user can send tweets and DMs through their own twitter account
  - a registered user can post on their friend's facebook wall
