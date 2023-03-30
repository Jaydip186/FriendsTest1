//
//  CommonFunction.swift
//  friends
//
//  Created by mac on 30/03/23.
//

import Foundation
import UIKit


class CommonFunction : NSObject{
    static let sharedInstance = CommonFunction()
    
    func show_aler(title_str:String,message_str:String) {
        let alertController = UIAlertController(title: title_str, message: message_str, preferredStyle: .alert)
        var rootViewController = UIApplication.shared.keyWindow?.rootViewController
        if let navigationController = rootViewController as? UINavigationController {
            rootViewController = navigationController.viewControllers.first
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                print("OK Pressed")
            }
        alertController.addAction(okAction)
        rootViewController?.present(alertController, animated: true, completion: nil)
    }
    func display_image(url_str:String,imagview:UIImageView)
    {
        guard let url = URL(string: url_str) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                imagview.image = UIImage(data: data)
            }
        }

        task.resume()
    }
}
