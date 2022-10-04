//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Angel Zambrano on 9/26/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    static let identifier = "TweetTableViewCell"
    
    let userImageView: UIImageView = {
        let imgview = UIImageView()
        imgview.translatesAutoresizingMaskIntoConstraints = false
        imgview.contentMode = .scaleToFill
        return imgview
    }()
    
    
    var tweetId: Int = -1
    
    let username: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "John Doe"
        
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let tweetLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tweet Content"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    // adding buttons to like and retweet
    
    let likeButton: UIButton = {
        let btn = UIButton()
//        btn.backgroundColor = .red
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "favor-icon-1"), for: .normal)
        btn.addTarget(self, action: #selector(likeTweet), for: .touchUpInside)

        
        return btn
    }()
    
    let retTweetButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "retweet-icon"), for: .normal)
        btn.addTarget(self, action: #selector(retTweetButtonWasPressed), for: .touchUpInside)
        return btn
    }()
    
    var favorited: Bool = false
    
    func setFavorite(_ isFavorited: Bool) {
        favorited = isFavorited
        if favorited {
            likeButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
        } else {
            likeButton.setImage(UIImage(named: "favor-icon-1"), for: .normal)
        }
    }
    
    @objc func retTweetButtonWasPressed() {
        
        
    }
    
    @objc func likeTweet() {
        let toBeFavorited = !favorited
        if toBeFavorited {
            TwitterAPICaller.client?.favotireTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { error in
                print("favorited did not succeed: \(error.localizedDescription)")
            })
        }else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { error in
                print("unfavorited: \(error.localizedDescription)")
            })
        }
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.backgroundColor = .yellow
//        contentView.backgroundColor = .yellow
        addSubviews()
        addConstraints()
        
        self.clipsToBounds = true
        
    }
    
    private  func addSubviews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(username)
        contentView.addSubview(tweetLbl)
        contentView.addSubview(likeButton)
        contentView.addSubview(retTweetButton)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            userImageView.widthAnchor.constraint(equalToConstant: 95),
            userImageView.heightAnchor.constraint(equalToConstant: 95)
        ])
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: contentView.topAnchor),
            username.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8)
        ])
        let contet: CGFloat = 252
        
//        username.setContentHuggingPriority(.defaultLow, for: .vertical)
//        username.contentHuggingPriority(for: .vertical).rawValue = 252
        username.setContentHuggingPriority(UILayoutPriority.init(rawValue: 252), for: .vertical)
        
        NSLayoutConstraint.activate([
            tweetLbl.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 4),
            tweetLbl.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8),
            tweetLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            tweetLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: tweetLbl.bottomAnchor, constant: 37),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            retTweetButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            retTweetButton.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -10)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
