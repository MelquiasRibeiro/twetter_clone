import UIKit
import Firebase

class RegistrationController: UIViewController {

    //MARK: - Properties
    
    private let imagePicker = UIImagePickerController()
    private var profileImage:UIImage?
    
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
        return fullNameTextField
        
    }()
    private lazy var userNameTextField:UITextField = {
        let userNameTextField = Utilities().textField(withPlaceHolder: "User Name")
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
        guard let profileImage = profileImage else {
            print("please, select a profile image")
            return
        }
        guard let email =  emailTextField.text else {return}
        guard let password  = passwordTextField.text else {return}
        guard let fullName = fullNameTextField.text else {return}
        guard let userName = userNameTextField.text else {return}
        
        let userData:RegisterUser = RegisterUser(userCredentials:UserCredentials(email: email, password: password), fullName: fullName, userName: userName, profileImage: profileImage)
        
        AuthService.shared.registration(userData: userData) { (error,ref) in
            let tabarController = MainTabBarController()
             self.navigationController?.pushViewController(tabarController, animated: true)
                     }
        
    }
    
    @objc func handleShowSignIn(){
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func handleAddProfilePhoto(){
        present(imagePicker,animated: true,completion: nil)
    }
    
    
    //MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
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
// MARK: - RegistrationController
extension RegistrationController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else {return}
        
        self.profileImage = profileImage
        plusPhotoButton.layer.cornerRadius = 150/2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.imageView?.contentMode = .scaleAspectFill
        plusPhotoButton.clipsToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 3
        
        self.plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        dismiss(animated: true)
        
        
    }
}
