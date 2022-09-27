//
//  LoginViewController.swift
//  Tuiter
//
//  Created by Angel Zambrano on 9/26/22.
//

import UIKit

class LoginViewController: UIViewController {

    let Loginbutton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .init(red: 76/255, green: 158/255, blue: 235/255, alpha: 1)
        btn.setTitle("Login", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(loginButtonWasPressed), for: .touchUpInside)
        
        return btn
        
    }()
    
    
    // TODO: present next screen modally
    
    @objc func loginButtonWasPressed() {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        let homeVCC = UINavigationController(rootViewController: HomeViewController())
        
//        self.modalPresentationStyle = .fullScreen
//        self.modalPresentationStyle = .automatic
        
        
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
//            self.present(homeVCC, animated: true, completion: nil)
            print("i am logged in")

        }, failure: { error in
            print(error.localizedDescription)
        })
        
        // adding the constraints for the login button
      
    }
    
    
    private func addconstraints() {
        NSLayoutConstraint.activate([
            Loginbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Loginbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addSubviews()
        addconstraints()

        // Do any additional setup after loading the view.
    }
    
    
    private func addSubviews() {
        view.addSubview(Loginbutton)
    }



}
