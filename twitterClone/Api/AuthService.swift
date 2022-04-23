import Foundation
import Firebase
import UIKit

struct AuthService {
    static let shared = AuthService()
    
    func logUserIn(userCredentials:UserCredentials,completion: AuthDataResultCallback?){
        Auth.auth().signIn(withEmail: userCredentials.email, password: userCredentials.password, completion: completion)
        print(userCredentials)
    }
    
    func registration(userData:RegisterUser,completion: @escaping(Error?,DatabaseReference)->Void){
        guard let imageData = userData.profileImage.jpegData(compressionQuality: 0.3) else { return}
        let fileName = NSUUID().uuidString
        let storageRef = STORAGE_PROFILE_IMAGES.child(fileName)

        Auth.auth().createUser(withEmail: userData.userCredentials.email, password: userData.userCredentials.password){(result,error) in
            if let error = error{
                print("ERROR: the error is \(error.localizedDescription)")
                return
            }
            print("Sucess: The user was created")
            guard let uuid = result?.user.uid else {return}
            
            storageRef.putData(imageData,metadata: nil){(meta,error)in
                storageRef.downloadURL{(url,error) in
                    
                    guard let profileImage = url?.absoluteString else {return}
                    
                    let values = ["email":userData.userCredentials.email,
                                  "userName":userData.userCredentials.password,
                                  "fullName":userData.fullName,
                                  "profileImageUrl":profileImage]
                    
                    REF_USERS.child(uuid).updateChildValues(values,withCompletionBlock: completion)
                }
                
            }
            
        }
    }
}
