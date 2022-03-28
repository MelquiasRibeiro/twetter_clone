import UIKit

class MainTabBarController: UITabBarController {

    
    //MARK: - Properties
    
    let actionButton:UIButton = {
        let actionButton = UIButton(type: .system)
        actionButton.tintColor = .white
        actionButton.backgroundColor = .twitterBlue
        actionButton.setImage(UIImage(named: "new_tweet"), for: .normal)
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return actionButton
    }()
    
    //MARK: - Selectors

    
    @objc func actionButtonTapped(){
        print("clicado")
    }
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        configureUI()
    }
    
    
    //MARK: - Helpers

    
    func configureUI(){
        tabBar.backgroundColor = .white
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        
        actionButton.layer.cornerRadius = 56/2
    }
    
    func configureViewControllers(){
        let feed = FeedController()
        let feedStackNavigation =   templateNavigationController(image: UIImage(named: "home_unselected")!, rootViewController: feed)
        
        let explore = ExplorerController()
        let explorerStacktackNavigation =   templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)

        let notifications = NotificationsController()
        let notificationsStacktackNavigation =   templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)
        
        let conversations = ConversationsController()
        let conversationsStacktackNavigation =   templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)


        viewControllers = [feedStackNavigation,explorerStacktackNavigation, notificationsStacktackNavigation,conversationsStacktackNavigation]
    }
    
    func templateNavigationController(image:UIImage?, rootViewController: UIViewController)->UINavigationController{
        let navigation = UINavigationController(rootViewController: rootViewController)
        
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = .white
        navigation.tabBarItem.image = image
        navigation.navigationBar.standardAppearance = standardAppearance
        navigation.navigationBar.compactAppearance = standardAppearance
        navigation.navigationBar.scrollEdgeAppearance = standardAppearance
        
        return navigation
    }

}
