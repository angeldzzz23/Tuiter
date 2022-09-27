//
//  ViewController.swift
//  Tuiter
//
//  Created by Angel Zambrano on 9/20/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var tweetArray = [NSDictionary]()
    var numberOfTweets: Int!
    
    // Adding pull to refresh
    
    let myRefreshControl = UIRefreshControl()
    
    
    let tableview: UITableView = {
       let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false

        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tb.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
    
        return tb
        
    }()
    
    @objc  func loadTweet() {
        let myURl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let params = ["count": 20]
        
        TwitterAPICaller.client?.getDictionariesRequest(url: myURl, parameters: params, success: { tweets in
            self.tweetArray.removeAll()
            for tweet in tweets {
                self.tweetArray.append(tweet)
                print(tweet)
            }
            self.tableview.reloadData()
            self.myRefreshControl.endRefreshing()
            
        }, failure: { error in
            print(error.localizedDescription)
        })
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        modalPresentationStyle = .fullScreen
        addConstraints()
//        navigationController?.navigationBar.scroll
        
        loadTweet()
    }
    
    private func addSubviews() {
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
        
        myRefreshControl.addTarget(self, action: #selector(loadTweet), for: .valueChanged)
        tableview.refreshControl = myRefreshControl
        
        
        let btn = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logOutButtonWasPressed))
        let backButton: UIBarButtonItem = btn
            self.navigationItem.leftBarButtonItem = backButton

    }
    
    
    @objc func logOutButtonWasPressed() {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            self.tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
       
    }


}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as! TweetTableViewCell
        
//        let user = tweetArray[indexPath.row]["user"] as! NSDictionary
//        let nameOfUser = user["name"] as? String
//        let tweetContent = tweetArray[indexPath.row]["text"] as? String
        
//        let imageUrl = URL(string: (user["profile_image_url_https"] as? String)!)
//        let data = try? Data(contentsOf: imageUrl!)
//        if let imageData = data {
            // set the cell imageview to the image
//            cell.userImageView.image = UIImage(data: imageData)
//        }
        
//        if let imageData = d
        
        
        
        
        
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

