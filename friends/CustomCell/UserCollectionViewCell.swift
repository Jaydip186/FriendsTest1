//
//  UserCollectionViewCell.swift
//  friends
//
//  Created by mac on 30/03/23.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var card_view: UIView!
    @IBOutlet weak var country_name_lbl: UILabel!
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var user_imageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        user_imageview.layer.cornerRadius = user_imageview.bounds.height/2
        user_imageview.layer.borderColor = UIColor.lightGray.cgColor
        user_imageview.layer.borderWidth = 6
        user_imageview.clipsToBounds = true
        
    }

}

extension UIView {
    func dropShadow(scale: Bool = true) {
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 5
    }
}
