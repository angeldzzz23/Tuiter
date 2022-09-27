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
        imgview.backgroundColor = .red
        return imgview
    }()
    
    let username: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.backgroundColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "John Doe"
        
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let tweetLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .green
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tweet Content"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.backgroundColor = .yellow
        contentView.backgroundColor = .yellow
        addSubviews()
        addConstraints()
        
    }
    
    private  func addSubviews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(username)
        contentView.addSubview(tweetLbl)
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
            tweetLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
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
