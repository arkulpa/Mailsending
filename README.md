# Mailsending
This works as expected on iOS <= 16.1; no error, the `MFMailComposeResult` is `.sent`.

But on iOS 16.2 no mail is sent, no error in the delegate method but the `MFMailComposeResult` is `.cancelled`.
