//
//  ViewController.swift
//  friends
//
//  Created by mac on 30/03/23.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var test_view: UIView!
    
    @IBOutlet weak var user_collectionview: UICollectionView!
    let userviewModel = UserViewModel()
    let  commonFunction =  CommonFunction()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.user_collectionview.register(UINib(nibName: "UserCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "user_cell")
       
        userviewModel.fetchUsers {
            // Reload the table view on the main thread
            DispatchQueue.main.async {
                self.user_collectionview.reloadData()
            }
        }
    }
    func applyShadowOnView(_ view: UIView) {
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 5
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userviewModel.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell : UserCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "user_cell", for: indexPath) as! UserCollectionViewCell
        let userObj = userviewModel.users[indexPath.item]
        commonFunction.display_image(url_str: userObj.picture.large, imagview: cell.user_imageview)
        cell.name_lbl.text = userObj.name.title + userObj.name.first + userObj.name.last
        cell.country_name_lbl.text = userObj.location.country
        applyShadowOnView(cell.card_view)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail_vc = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        detail_vc.userdetailObj = userviewModel.users[indexPath.item]
        self.navigationController?.pushViewController(detail_vc, animated: true)
    }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width-40)/3, height: 234)
    }
}
