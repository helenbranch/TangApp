//
//  HomeNavController.swift
//  TangApp
//
//  Created by helen branch on 12/12/23.
//

import UIKit

class HomeNavController: UINavigationController {
        
    let tabBarVC = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        //set up header
    //       let headerView = CustomHeaderView()
    //       view.addSubview(headerView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBarSetup()
    }
        
    func tabBarSetup() {
        
        //every tab is connected to one view controller -> each view controller is tasked with setting up its tab bar item
        //make constants of each of the view controllers which will be passed into the bar and become each of the tabs
        //to get a title at the top we have to wrap each of our view controllers within a navigation controller and pass in the view controller as the root
            
        let vc1 = MapViewController()
        let vc2 = UINavigationController(rootViewController: HomeViewController())
        let vc3 = ProfileViewController()
            
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
        tabBarVC.modalPresentationStyle = .popover
        present(tabBarVC, animated: false)
    }
        
        
}


