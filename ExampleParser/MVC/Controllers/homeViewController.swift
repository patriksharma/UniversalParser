//
//  ViewController.swift
//  ExampleParser
//
//  Created by prateek sharma on 23/04/19.
//  Copyright © 2019 PrateekSharma. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! // tableview to display data
    @IBOutlet weak var progressActivityIndicator: UIActivityIndicatorView! // specify the loading of table view data
    
    let ImageHandler = ImageTableViewHandler()//instating this class to deal with tableview delegates and datasources
    var refreshControl = UIRefreshControl() //Apple default control for pull to refresh
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // pull to refresh, refresh control method and text to display
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh...")
        refreshControl.addTarget(self, action: #selector(reload(sender:)), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl) //Adding the pull to refresh control to tableview...
        
        tableView.delegate = ImageHandler // Assigning the class to the tableview delegate
        tableView.dataSource = ImageHandler// AAssigning the class to the tableview datasource
        tableView.isHidden = true //hide table view until data loads
        
        fetchImagesData() // method to call API and show fetched data on tableview
        
    }
    
    //MARK: Fetch JSON DATA from API
    func fetchImagesData(){
        let parsingJSON = JSON()
        //Call this function to get the API json data as a CellViewModel array as cards
        parsingJSON.fetchImagesData(urlString: DATA_URL) { [weak self](success, cards) in
            if success{
                //CellViewModel array and activityIndicator for the handler class of CardsTableview
                self?.ImageHandler.intializeComponents(cards: cards,activityIndicator: (self?.progressActivityIndicator)!)
                //Function to first add 10 cards to some array of cards
                self?.ImageHandler.addCards()
                self?.tableView.reloadData()//reloads tableview data.
                self?.refreshControl.endRefreshing()// end pull to refresh.
            }
            else{
                let alert = UIAlertController(title: "Error", message: "Failed to load.", preferredStyle: .alert)
                alert.present(self!, animated: true, completion: nil)
            }
        }
    }
    
    //Function to call the API again to refresh the tableview for new data
    @objc func reload(sender:AnyObject) {
        fetchImagesData() // fetch images JSON data from API
    }
}


