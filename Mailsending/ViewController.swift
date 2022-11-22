//
//  ViewController.swift
//  Mailsending
//
//  Created by Stefan Walkner on 21.11.22.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    private let image: Data = {
        let url = Bundle.main.url(forResource: "website", withExtension: "jpg")!
        return try! Data(contentsOf: url)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        sendEmail()
    }
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["..."])
            mail.setSubject("some subject")
            let imageString = image.base64EncodedString()
            let messageBody = "<img src='data:image/jpeg;base64,\(imageString)' width='\(300)'>"
            mail.setMessageBody(messageBody, isHTML: true)

            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        debugPrint(result.rawValue, error?.localizedDescription ?? "")
        controller.dismiss(animated: true)
    }
}
