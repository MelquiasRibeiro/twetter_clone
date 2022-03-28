import UIKit

class RegistrationController: UIViewController {

    //MARK: - Properties
    
  
    private lazy var plusPhotoButton: UIButton = {
        let plusPhotoButton = UIButton(type: .system)
        plusPhotoButton.setImage(UIImage(named: "plus_photo"), for: .normal)
        plusPhotoButton.tintColor = .white
        plusPhotoButton.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
        return plusPhotoButton
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
    private lazy var  fullNameContinerView: UIView = {
        let padlockIcon = UIImage(named: "ic_person_outline_white_2x")
        let passwordContinerView = Utilities().inputContainerView(withImage:padlockIcon!,textField:  fullNameTextField)

        return passwordContinerView
        
    }()
    private lazy var  userNameContinerView: UIView = {
        let padlockIcon = UIImage(named: "ic_person_outline_white_2x")
        let passwordContinerView = Utilities().inputContainerView(withImage:padlockIcon!,textField:  userNameTextField)

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
    
    private lazy var fullNameTextField:UITextField = {
        let fullNameTextField = Utilities().textField(withPlaceHolder: "Full Name")
        fullNameTextField.isSecureTextEntry = true
        return fullNameTextField
        
    }()
    private lazy var userNameTextField:UITextField = {
        let userNameTextField = Utilities().textField(withPlaceHolder: "User Name")
        userNameTextField.isSecureTextEntry = true
        return userNameTextField
        
    }()
    
    private lazy var registerButton:UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Register", for: .normal)
        loginButton.backgroundColor = .white
        loginButton.setTitleColor(.twitterBlue, for: .normal)
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.layer.cornerRadius = 5
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return loginButton
        
    }()
    
    
    private lazy var singInButton:UIButton = {
        let singInButton = Utilities().attributedButton("Already have an account? ", "Sign in")
        singInButton.addTarget(self, action: #selector(handleShowSignIn), for: .touchUpInside)
        return singInButton
        
    }()
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: - Selectors
    @objc func handleRegister(){
       print("saved")
    }
    
    @objc func handleShowSignIn(){
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func handleAddProfilePhoto(){
        print ("saved")
    }
    
    
    //MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        plusPhotoButton.setDimensions(width: 150, height: 150)
        
        
        let stackView  = UIStackView(arrangedSubviews: [emailContinerView,passwordContinerView,fullNameContinerView,userNameContinerView,registerButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        stackView.anchor(top:plusPhotoButton.bottomAnchor,left: view.leftAnchor,
                         right: view.rightAnchor,paddingLeft: 16,paddingRight: 16)
        
        
        view.addSubview(singInButton)
        
        singInButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.bottomAnchor, paddingTop: -40)

    }




}
