//
//  ViewController.swift
//  LearKKBOX
//
//  Created by Neal on 2020/1/17.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var headerView: UIView = {
        let header = UIView()
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height / 2)
        return header
    }()
    
    lazy var headerImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height / 2)
        image.image = UIImage(named: "headerView")
        return image
    }()
    
    let userProvider = UserProvider()
    
    @IBOutlet weak var kkTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kkTableView.delegate = self
        
        kkTableView.dataSource = self
        
        kkTableView.rowHeight = UITableView.automaticDimension
        
        kkTableView.contentInsetAdjustmentBehavior = .never

//        getUserToken()
        
        setHerderView()
        
        
        // Do any additional setup after loading the view.
    }
    
    func setHerderView() {
        
        headerView.addSubview(headerImageView)
        
        kkTableView.tableHeaderView = headerView
    }
    
    func getUserToken() {
        
        userProvider.getUserToken(clientId: "3c5b332258f4fd5433febf15af68942f", clientSecret: "74c0d821257f754e04c56738eef0c3eb", grantType: "client_credentials") { (result) in
            switch result {
            case .success():
                print("Success")
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPlaylist() {
        let userToken = UserInfoManager.shared.getUserId()
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? KKTableViewCell else { return UITableViewCell() }
        cell.kkImage.image = UIImage(named: "song")
        cell.nemeLabel.text = "LoveSong"
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
