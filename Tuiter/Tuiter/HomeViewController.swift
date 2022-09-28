//
//  ViewController.swift
//  Tuiter
//
//  Created by Angel Zambrano on 9/20/22.
//

import UIKit

/// for debugging purposes, you can ignore this
/// i am not doing anything with this.
class HomeViewController: UIViewController {
    
    let tableview: UITableView = {
       let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.backgroundColor = .red
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tb
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(tableview)
        tableview.dataSource = self

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
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        return cell
    }
    
    
}

