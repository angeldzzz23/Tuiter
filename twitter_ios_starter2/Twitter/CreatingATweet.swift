//
//  CreatingATweet.swift
//  Twitter
//
//  Created by Angel Zambrano on 10/3/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class CreatingATweet: UIViewController {

    let textview: UITextView = {
       let txtview = UITextView()
        txtview.backgroundColor = .yellow
        txtview.translatesAutoresizingMaskIntoConstraints = false
        return txtview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .blue
        view.backgroundColor = .white
        

        // Do any additional setup after loading the view.
        
        addViews()
        addConstrains()
        addBar()
    }
    
    private func addViews() {
        view.addSubview(textview)
        
        
    }
    
    private func addBar() {
        let btn = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelButtonWasPressed))
        let backButton: UIBarButtonItem = btn
            self.navigationItem.leftBarButtonItem = backButton
        
        let tweetBtn = UIBarButtonItem(title: "tweet", style: .plain, target: self, action: #selector(tweetButtonWasPressed))
        let rightButton: UIBarButtonItem = tweetBtn
        self.navigationItem.rightBarButtonItem = rightButton
        
        
    }
    
    @objc func cancelButtonWasPressed() {
        dismiss(animated: true)
    }
    
    @objc func tweetButtonWasPressed() {
        if !textview.text.isEmpty {
            TwitterAPICaller.client?.postTweet(tweetString: textview.text, success: {
                self.dismiss(animated: true)
            }, failure: { error in
                print("error: \(error.localizedDescription)")
            })
        }
    }
    
    
    
    private func addConstrains() {
        
        NSLayoutConstraint.activate([
            textview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textview.heightAnchor.constraint(equalToConstant: 128)
        ])
    }
    

  

}
