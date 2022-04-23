import Foundation
import UIKit


struct UserCredentials {
    let email:String
    let password: String
}

struct RegisterUser{
    var userCredentials: UserCredentials
    let fullName: String
    let userName: String
    var profileImage: UIImage
}

struct User {
    var uuid: String
    let fullName: String
    let userName: String
    let email:String
    var profileImageURL: URL?
    
    
    init(uid:String,user:[String: AnyObject]) {
        self.uuid = uid
        self.fullName = user["fullName"] as? String ?? ""
        self.userName = user["userName"] as? String ?? ""
        self.email = user["email"] as? String ?? ""
        if let profileImageURLString = user["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageURLString) else {return}
            self.profileImageURL = url
        }
    }
}
