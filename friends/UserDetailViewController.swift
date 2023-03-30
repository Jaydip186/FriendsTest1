//
//  UserDetailViewController.swift
//  friends
//
//  Created by mac on 30/03/23.
//

import UIKit
import MessageUI

class UserDetailViewController: UIViewController {

    @IBOutlet weak var user_imageview: UIImageView!
    @IBOutlet weak var fullName_lbl: UILabel!
    @IBOutlet weak var address_lbl: UILabel!
    @IBOutlet weak var cityStateCounteru_lbl: UILabel!
    @IBOutlet weak var email_btn: UIButton!
    var userdetailObj: User?
    @IBOutlet weak var phone_lbl: UILabel!
    @IBOutlet weak var cell_lbl: UILabel!
    let  commonFunction =  CommonFunction()
    override func viewDidLoad() {
        super.viewDidLoad()
        user_imageview.layer.cornerRadius = user_imageview.bounds.height/2
        user_imageview.clipsToBounds = true
        commonFunction.display_image(url_str: userdetailObj?.picture.large ?? "", imagview: user_imageview)
        fullName_lbl.text = (userdetailObj?.name.title ?? "") + (userdetailObj?.name.first ?? "") + (userdetailObj?.name.last ?? "")
        address_lbl.text = "\(userdetailObj?.location.street.number ?? 0)"  + (userdetailObj?.location.street.name ?? "")
        cityStateCounteru_lbl.text = (userdetailObj?.location.city ?? "") + ", " + (userdetailObj?.location.state ?? "") + "," + (userdetailObj?.location.country ?? "")
        email_btn.setTitle(userdetailObj?.email ?? "", for: .normal)
        phone_lbl.text = userdetailObj?.phone ?? ""
        cell_lbl.text = userdetailObj?.cell ?? ""
    }
    
    @IBAction func btn_open_mail(_ sender: UIButton) {
        let recipientEmail = email_btn.title(for: .normal)
                let subject = "Test Email"
                let body = "This is a test email sent from my iOS app."

                let mailtoURL = URL(string: "mailto:\(recipientEmail)?subject=\(subject)&body=\(body)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
                if UIApplication.shared.canOpenURL(mailtoURL!) {
                    UIApplication.shared.open(mailtoURL!, options: [:], completionHandler: nil)
                } else {
                    // show failure alert
                }
    }
    
}
