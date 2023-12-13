//
//  HomeViewController.swift
//  TangAppT2
//
//  Created by helen branch on 12/5/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //set up core data to be used for exhibtion info
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    
    //set up table view for exhibtion titles using closure pattern
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(ExhibitionTableViewCell.self, forCellReuseIdentifier: ExhibitionTableViewCell.identifier)
        return table
    }()
    
    var exhibitionItems: [ExhibitionItem]?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
        title = "Home"
        
        //get file ready
        parseJSON()
        
        //set up table view
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //create frame for table view
        tableView.frame = CGRect(x: 0, y: 0 , width: view.bounds.width, height: view.bounds.height-20)
        
        populateCurrentExhibitions()
    }
    
    
    //functions needed for table view custom cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExhibitionTableViewCell.identifier, for: indexPath)
        return cell
    }
    
    //function to set up number of cells (should be based on number of exhibitions in getCurrentExhibitions array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exhibitionItems!.count
    }
    
// function to select a row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Access the selected cell using indexPath and take info and pass into the exhibition extended view
        let selectedCell = tableView.cellForRow(at: indexPath)
        
        //create a new view controller for close up of exhibiton expanded page
        let currentExhibitionVC = ExhibitionCloseUpViewController(exhibitionTitle: (exhibitionItems![indexPath.row].title))
                                                                  
        navigationController?.pushViewController(currentExhibitionVC, animated: true)
//        print("Selected row at indexPath: \(indexPath.row)")
    }
    
    //set up JSON parse for current exhibition info
    func parseJSON() {
        guard let path = Bundle.main.path(forResource: "currentExhibitions", ofType:"json") else {
            print("failed to find json file")
            return
        }
        
//        var exhibitionItems: ExhibitionData?
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            
            let exhibitionData = try JSONDecoder().decode(ExhibitionData.self, from: jsonData)
            exhibitionItems = exhibitionData.data
        
        } catch {
            print("error: \(error)")
            return
        }
    }
    
    //returns an array of all the current exhibtion items
    func getCurrentExhibitions() -> [Exhibition]?  {
        do {
            let currrentExhibitions = try context.fetch(Exhibition.fetchRequest())
            return currrentExhibitions
        }
        catch {
            print("error: \(error)")
            return nil
        }
    }
    
    //uses the json data to create exhibition ittems and store them in core data
    func populateCurrentExhibitions() {
        for item in exhibitionItems! {
            let exhibtion = Exhibition(context: context)
            exhibtion.title = item.title
            exhibtion.location = item.location
            exhibtion.blurb = item.description
            exhibtion.startDate = item.startDate
            exhibtion.endDate = item.endDate
            exhibtion.curatorInfo = item.curationInfo
            exhibtion.checklist = item.imageGallery
            exhibtion.image = item.mainImage
            
            do {
                try context.save()
            }
            catch {
                print("error: \(error)")
            }
        }
    
    }

}


