# WUPHF - Whenever. Wherever.

Inspired by [NBC's The Office](http://www.nbc.com/the-office)

This is an open-source toy app to annoy your friends. The live demo can be viewed [here](http://www.wuphf.io/). The goal is to eventually create user sign-ups so that a registered user can save friends to their **dog pack**. Wuphf'ing a member of your dog pack will be easier than manually entering recipient information every time.

## How It Works (With Images)

__Fill out the form__

<img src="https://cloud.githubusercontent.com/assets/8096483/24992866/72c70b66-1fd8-11e7-82df-8848606133e5.png" width="500px">

__Wuphfee receives an email__

<img src="https://cloud.githubusercontent.com/assets/8096483/24992865/72c589c6-1fd8-11e7-8388-1a8fc452f781.png" width="500px">

__Wuphfee receives a text__

<img src="https://cloud.githubusercontent.com/assets/8096483/24992895/97c09248-1fd8-11e7-8528-8186805a1f65.png" width="500px">

__Wuphfee is tweeted at__

<img src="https://cloud.githubusercontent.com/assets/8096483/24992864/72b7d1c8-1fd8-11e7-8f52-2404073fbf7e.png" width="500px">

## Sending a Wuphf from the landing page

Currently, Wuphf'ing from the landing page will:

* Send the recipient an email via SendGrid
* Send the recipient a text message via Twilio
* Post a tweet with an @ mention of the recipient's twitter handle to the [Wuphf's twitter page](https://twitter.com/wuphfwuphf)

## TODO

* Hash Twitter tokens
* Connect to Facebook's Messenger API?
* Look into building a Facebook bot?
* Better error handling when user sends DM to someone on twitter who they don't follow
* Weekly subscription to send WUPHFs of office quotes
* Add API documentation to `/api/v1` views
* Profanity Filter
* Figure out a way to add DM functionality. Right now DMs fail when a user tries to send one to a user who doesn't follow them
