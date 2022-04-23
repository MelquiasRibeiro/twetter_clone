import UIKit
import SDWebImage

class FeedController: UIViewController {
    //MARK: - Properties
    
    var user: User? {
        didSet{
            configureProfileButton()
        }
    }
    
    let profileImageView:UIImageView = {
        let  profileImageView = UIImageView()
        profileImageView.backgroundColor = .twitterBlue
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds =  true
        return profileImageView
    }()
  

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }

    
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        let twitterLogo = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        twitterLogo.setDimensions(width: 44, height: 44)
        twitterLogo.contentMode = .scaleAspectFit
        navigationItem.titleView = twitterLogo
      
    }
    
    func configureProfileButton(){
        guard user != nil else {
            return
        }
        profileImageView.sd_setImage(with: user?.profileImageURL, completed: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
   
}
