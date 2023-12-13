//
//  HomeViewController.swift
//  TangAppT2
//
//  Created by helen branch on 12/5/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    //set up table view using closure pattern
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(ExhibitionTableViewCell.self, forCellReuseIdentifier: ExhibitionTableViewCell.identifier)
        return table
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
        title = "Home"
        
        //set up table view
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: 200 , width: view.bounds.width, height: 200)
    }
    
    
    //functions needed for table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExhibitionTableViewCell.identifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 5
//    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//
}
