//
//  ExhibitionCloseUpViewController.swift
//  TangAppT2
//
//  Created by helen branch on 12/12/23.
//

import UIKit

class ExhibitionCloseUpViewController: UIViewController {
    
    var exhibitionTitle : String
    
    private let eTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "RectaW01-MediumCondensed", size: 30)
        label.text = "Exhibition Title"
        // Set the text alignment to center
        label.textAlignment = .center
        return label
    }()

    
    //init
    
    init(exhibitionTitle: String) {
        self.exhibitionTitle = exhibitionTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(eTitle)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        eTitle.text = exhibitionTitle
        eTitle.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
    }
    
}
