//
//  ViewController.swift
//  TangApp
//
//  Created by helen branch on 11/14/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //set outlet for tableView
    @IBOutlet var table: UITableView!
    
    //create an array of model objects
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//         Delegate and datasource for table view
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        models.append(Model(text: "First", imageName: "image_1"))
        models.append(Model(text: "Second", imageName: "image_2"))
        models.append(Model(text: "Third", imageName: "image_3"))
        models.append(Model(text: "Fourth", imageName: "image_4"))
        models.append(Model(text: "First", imageName: "image_1"))
        models.append(Model(text: "Second", imageName: "image_2"))
        models.append(Model(text: "Third", imageName: "image_3"))
        models.append(Model(text: "Fourth", imageName: "image_4"))
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBarSetup()
    }
  
    func tabBarSetup() {
        
        let tabBarVC = UITabBarController()
        
        //every tab is connected to one view controller -> each view controller is tasked with setting up its tab bar item
        //make constants of each of the view controllers which will be passed into the bar and become each of the tabs
        //to get a title at the top we have to wrap each of our view controllers within a navigation controller and pass in the view controller as the root

        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        
        //set titles here because the title doesn't show up until the view controllers are called
        vc1.title = "Map"
        vc2.title = "Home"
        vc3.title = "Profile"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
        
        //set images for the tab bars; first get all items for the tab bars and then loop through them
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        //number of image names need to match the number of tab bars
        let images = ["mappin.circle.fill", "house", "person.circle.fill"]
        
        
        //looping through images
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        //present tab bar
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: false)
    }
    
    
    //new classes for the new view controllers -> inherits from UIViewController
    class FirstViewController: UIViewController /*UITableViewDelegate, UITableViewDataSource */{
        
//        @IBOutlet var table: UITableView!
//
//        var models = [Model]()
        

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .orange
            title = "Map"
            
//            table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
//            
//            table.delegate = self
//            table.dataSource = self
        }
        
//        func addModels() {
//            //create models
//            models.append(Model(text: "First", imageName: "image_1"))
//            models.append(Model(text: "Second", imageName: "image_2"))
//            models.append(Model(text: "Third", imageName: "image_3"))
//            models.append(Model(text: "Fourth", imageName: "image_4"))
//            models.append(Model(text: "First", imageName: "image_1"))
//            models.append(Model(text: "Second", imageName: "image_2"))
//            models.append(Model(text: "Third", imageName: "image_3"))
//            models.append(Model(text: "Fourth", imageName: "image_4"))
//        }
//        
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return models.count
//        }
//    
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 250
//        }
//    
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
//    
//            cell.configure(with: models)
//    
//            return cell
//        }
    }

    class SecondViewController: UIViewController/*, UITableViewDelegate, UITableViewDataSource*/ {
        
        //        create table view
        //        private var tableView = UITableView()
        //        private let tableView: UITableView = {
        //            let tableView = UITableView()
        //            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //            return tableView
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .lightGray
            title = "Home"
            //            setTableView()
            //            tableView.backgroundColor = .purple
        }
    }
        //        }
        
        
        
        
        //        override func viewDidLayoutSubviews() {
        //            super.viewDidLayoutSubviews()
        ////            tableView.frame = view.bounds
        //        }
        //
        //        // fucntion to setup table view
        //        func setTableView() {
        //            tableView.center = view.center
        //            tableView.frame =
        ////            tableView.delegate = self
        ////            tableView.dataSource = self
        ////            tableView.separatorColor = UIColor.clear
        ////            tableView.backgroundColor = .purple
        //
        //            self.view.addSubview(tableView)
        //
        //            tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        //        }
        //
        //        //functions needed for table view
        //        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //            <#code#>
        //        }
        //
        //        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //            <#code#>
        //        }
        //    }
        
        class ThirdViewController: UIViewController {
            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .purple
                title = "Profile"
            }
        }
        
        //    Table
        //
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return models.count
            }
        
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 250
            }
        
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        
                cell.configure(with: models)
        
                return cell
            }
    }

//create a struct for the models in the array
struct Model {
    let text: String
    let imageName: String
    
    init(text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
}

