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
        // Set the text alignment to center
        label.textAlignment = .center
        return label
    }()
    
    private let eDescription: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "RectaW01-MediumCondensed", size: 20)
        label.text = "Nec ullamcorper sit amet risus nullam eget felis eget nunc. Leo in vitae turpis massa sed. Libero nunc consequat interdum varius sit amet. Cras adipiscing enim eu turpis egestas pretium aenean. Massa massa ultricies mi quis hendrerit dolor magna. Posuere lorem ipsum dolor sit. Vitae turpis massa sed elementum tempus. Etiam sit amet nisl purus in mollis nunc sed id."
        // Set the text alignment to center
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let seeWorks: UIButton = {
        //create button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setTitle("See the Works >>", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "RectaW01-MediumCondensed", size: 15)
        return button
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
//        view.addSubview(eTitle)
//        view.addSubview(eDescription)
        setUpSubviews()
        
        //add action to button
        seeWorks.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    func setUpSubviews() {
        eTitle.text = exhibitionTitle
        view.addSubview(eTitle)
        view.addSubview(eDescription)
        view.addSubview(seeWorks)
        setupConstraints()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        eTitle.text = exhibitionTitle
//        eTitle.frame = CGRect(x: 0, y: 0, width: view.bounds.width-20, height: view.bounds.height/3)
//        eDescription.frame = CGRect(x: 0, y: 0, width: view.bounds.width-20, height: (view.bounds.height/3 + view.bounds.height/3))
//    }
    
    func setupConstraints() {
        eTitle.translatesAutoresizingMaskIntoConstraints = false
        eDescription.translatesAutoresizingMaskIntoConstraints = false
        seeWorks.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            //set up where title is
            eTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            eTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            eTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            //set up where description is
            eDescription.topAnchor.constraint(equalTo: eTitle.bottomAnchor, constant: 30),
            eDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            eDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            //set up where button is
            seeWorks.topAnchor.constraint(equalTo: eDescription.bottomAnchor, constant: 30),
            seeWorks.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            seeWorks.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
        ])
    }
    
    //objective c function so selector can reference this
    @objc func didTapButton() {
    
        let worksCollection = WorksUpCloseViewController()
        navigationController?.pushViewController(worksCollection, animated: true)
        // Perform any action or navigation based on the selection
    }
    
    
}
