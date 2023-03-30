//
//  userViewModel.swift
//  friends
//
//  Created by mac on 30/03/23.
//

import Foundation
import UIKit


class UserViewModel {
    var users: [User] = []
    let  commonFunction =  CommonFunction()

    func fetchUsers(completion: @escaping () -> Void) {
        // Implement the API request using URLSession or a networking library
        
        
        if(NetworkManager.isConnectedToInternet()) {
            URLSession.shared.dataTask(with: URL(string: base_url)!) { data, response, error in
                guard let data = data else { return }
                
                
                let decoder = JSONDecoder()
                do {
                    let user_response = try decoder.decode(UserResponse.self, from: data) //<- Pass an Array type
                    self.users = user_response.results
                } catch {
                    print(error)
                    DispatchQueue.main.async {
                        self.commonFunction.show_aler(title_str: "Alert", message_str: "Try Again")
                    }
                    
                    
                    
                }
                
                completion()
                
            }.resume()
        } else {
            commonFunction.show_aler(title_str: "", message_str: NO_INTERNET)
        }
        
        
    }
    func dataToJSON(data: Data) -> Any? {
       do {
           return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
       } catch let myJSONError {
           print(myJSONError)
       }
       return nil
    }

    var numberOfUsers: Int {
        return users.count
    }

    func userName(at index: Int) -> String {
        return users[index].name.title + users[index].name.first + users[index].name.last
    }
    
    func countryName(at index: Int) -> String {
        return users[index].location.country
    }
}
