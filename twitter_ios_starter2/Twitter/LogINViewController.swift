//
//  LogINViewController.swift
//  Twitter
//
//  Created by Angel Zambrano on 9/26/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LogINViewController: UIViewController {

   
  
    let Loginbutton: UIButton = {
        let btn = UIButton(type: .system)
//        btn.backgroundColor = .init(red: 76/255, green: 158/255, blue: 235/255, alpha: 1)
        btn.setTitle("Login", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(loginButtonWasPressed), for: .touchUpInside)
        
        return btn
        
    }()
    
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            let homeVCC = UINavigationController(rootViewController: HomeViewController())
            homeVCC.modalPresentationStyle = .fullScreen
            self.present(homeVCC, animated: true)
        }
    }
    
    
    // TODO: present next screen modally
    
    @objc func loginButtonWasPressed() {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        let homeVCC = UINavigationController(rootViewController: HomeViewController())
        homeVCC.modalPresentationStyle = .fullScreen
        
//        self.modalPresentationStyle = .fullScreen
//        self.modalPresentationStyle = .automatic
        
         

        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.present(homeVCC, animated: true)
            

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
