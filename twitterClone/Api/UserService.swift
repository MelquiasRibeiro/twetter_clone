import Foundation
import Firebase


struct UserService {
   static let shared = UserService()

    func getUserData(completion: @escaping(User)->Void ){
        guard let uuid = Auth.auth().currentUser?.uid else {return}
        
        REF_USERS.child(uuid).observeSingleEvent(of: .value){
            snapshot in
            guard let response = snapshot.value as? [String: AnyObject] else {return}
            
            let user: User = User(uid: uuid, user: response)
            
            completion(user)
        }
        
    }
}
