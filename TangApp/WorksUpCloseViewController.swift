//
//  WorksUpCloseViewController.swift
//  TangApp
//
//  Created by helen branch on 12/13/23.
//

import UIKit

class WorksUpCloseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    private let worksView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.isPagingEnabled = true
        return collection
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        view.addSubview(worksView)
        worksView.delegate = self
        worksView.dataSource = self
        
        //register custom cell
        worksView.register(ArtWorkCardCollectionViewCell.self, forCellWithReuseIdentifier: ArtWorkCardCollectionViewCell.identifier)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        worksView.frame = CGRect(x: 0, y: 0 , width: view.bounds.width, height: view.bounds.height)
    }
    
    
    //collection view funcs
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = worksView.dequeueReusableCell(withReuseIdentifier: ArtWorkCardCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let height = view.bounds.height
        return CGSize(width: width, height: height)
    }

}


