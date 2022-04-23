//
//  UploadTwetterController.swift
//  twitterClone
//
//  Created by Idwall Go Dev 012 on 09/04/22.
//

import UIKit

class UploadTwetterController: UIViewController {
    // MARK: - Properties
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureNavigationBar()
    }
    
    // MARK: - selectors
    @objc func handleCancel (){
        dismiss(animated: true,completion: nil)
    }
    // MARK: - api
    // MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
    }
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
    }

}
