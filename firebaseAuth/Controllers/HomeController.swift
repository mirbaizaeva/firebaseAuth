//
//  HomeController.swift
//  firebaseAuth
//
//  Created by Nurjamal Mirbaizaeva on 18/9/23.
//

import UIKit

class HomeController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Loading..."
        label.numberOfLines = 2
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserError(on: self, with: error)
                return
            }
            
            if let user = user {
                self.label.text = "\(user.username)\n\(user.email)"
            }
        }
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogout))
        
        self.view.addSubview(label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    @objc private func didTapLogout() {
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as?
                SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
}
