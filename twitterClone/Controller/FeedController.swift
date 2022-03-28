import UIKit

class FeedController: UIViewController {
    //MARK: - Properties
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }

    
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        let twitterLogo = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        twitterLogo.contentMode = .scaleAspectFit
        navigationItem.titleView = twitterLogo


    }
   
}
