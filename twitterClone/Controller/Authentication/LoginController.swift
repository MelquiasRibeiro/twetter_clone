import UIKit

class LoginController: UIViewController {

    //MARK: - Properties
    
    private lazy var logoImageView: UIImageView = {
       let logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.clipsToBounds = true
        logoImageView.image = UIImage(named: "TwitterLogo")
        
        
        return logoImageView
    }()
    
    private lazy var  emailContinerView: UIView = {
        let mailIcon = UIImage(named: "ic_mail_outline_white_2x-1")
        let emailContinerView = Utilities().inputContainerView(withImage:mailIcon!, textField: emailTextField)
        return emailContinerView
        
    }()
    
    private lazy var  passwordContinerView: UIView = {
        let padlockIcon = UIImage(named: "ic_lock_outline_white_2x")
        let passwordContinerView = Utilities().inputContainerView(withImage:padlockIcon!,textField:  passwordTextField)

        return passwordContinerView
        
    }()
    
    private lazy var emailTextField:UITextField = {
       let emailTextField = Utilities().textField(withPlaceHolder: "Email")
        return emailTextField
        
    }()
    
    private lazy var passwordTextField:UITextField = {
        let passwordTextField = Utilities().textField(withPlaceHolder: "Password")
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
        
    }()
    
    private lazy var loginButton:UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Log In", for: .normal)
        loginButton.backgroundColor = .white
        loginButton.setTitleColor(.twitterBlue, for: .normal)
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.layer.cornerRadius = 5
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return loginButton
        
    }()
    
    
    private lazy var singUpButton:UIButton = {
        let singUpButton = Utilities().attributedButton("Don't have an account? ", "Sign UP")
        singUpButton.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return singUpButton
        
    }()
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: - Selectors
    @objc func handleLogin(){
        let homeController = MainTabBarController()
        navigationController?.pushViewController(homeController, animated: true)
    }
    @objc func handleShowSignUp(){
            let registrationController = RegistrationController()
        navigationController?.pushViewController(registrationController, animated: true)
        
    }
    
    
    //MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
        
        let stackView  = UIStackView(arrangedSubviews: [emailContinerView,passwordContinerView,loginButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        stackView.anchor(top:logoImageView.bottomAnchor,left: view.leftAnchor,
                         right: view.rightAnchor,paddingLeft: 16,paddingRight: 16)
        
        
        view.addSubview(singUpButton)
        
        singUpButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.bottomAnchor, paddingTop: -40)

    }

}
