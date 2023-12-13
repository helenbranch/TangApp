//
//  ViewController.swift
//  TangAppT2
//
//  Created by helen branch on 12/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    let tabBarVC = UITabBarController()
    
    let vc1 = UINavigationController(rootViewController: MapViewController())
    let vc2 = UINavigationController(rootViewController: HomeViewController())
    let vc3 = UINavigationController(rootViewController: ProfileViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBarSetup()
    }
    
    func tabBarSetup() {
    
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
    
    
    
}
