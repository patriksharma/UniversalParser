//
//  ImageTableViewHandler.swift
//  ExampleParser
//
//  Created by prateek sharma on 23/04/19.
//  Copyright © 2019 PrateekSharma. All rights reserved.
//

import Foundation
import UIKit
import UniversalParser


class ImageTableViewHandler: NSObject,UITableViewDelegate, UITableViewDataSource{
    var cardArr = [CellViewModel]() //Array to hold all images with other data
    var fewCards = [CellViewModel]() //hold few cards for pagination
    var activityIndicator = UIActivityIndicatorView()
    let imagesLoader = ImagesLoader() //loading images from API
    var index = 0
    let END = 9
    var isScrolling = false
    
    //Function for intializing the cards array and activityIndicator...
    func intializeComponents(cards: [CellViewModel], activityIndicator: UIActivityIndicatorView){
        self.cardArr = cards
        self.activityIndicator = activityIndicator
    }
    
    //logic to add 10 images at a time.
    func addCards(){
        for card in stride(from: index, to: index + END, by: 1) {
            fewCards.append(cardArr[card])
        }
    }
    
    //MARK: Tableview Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fewCards.count // number of rows in tableview section.
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imgViewCell") as! ImageTblViewCell
        activityIndicator.isHidden = true //Hiding the activity indicator since data is loaded...
        
        let backgroundView = UIView() // initializing a black view
        backgroundView.backgroundColor = UIColor.clear // provided clear color to view
        cell.selectedBackgroundView = backgroundView // background view should be nil.
        tableView.isHidden = false //Showing the tableview once data is loaded...
        
        
        //loading UI elements of tableview cell
        cell.userLabel.text = fewCards[indexPath.row].user.name
        cell.dateLabel.text = fewCards[indexPath.row].created_at.components(separatedBy: "T").first
        let time = fewCards[indexPath.row].created_at.toDate()
        cell.timeLabel.text = time?.getElapsedInterval()
        cell.likesLabel.text = String(fewCards[indexPath.row].likes)
        
        //loading profile images of user.
        imagesLoader.loadProfileImage(imageView: cell.profileImageView, urlString: fewCards[indexPath.row].user.profile_image.small)
        
        let loader = Loader()
        loader.setLimitInKiloBytes(limit: 30720) //30 MB maximum capacity to store
        
        //calling function to load remote images
        imagesLoader.loadMainImage(loader: loader, imageView: cell.mainImageView, urlString: fewCards[indexPath.row].urls.regular, cancelButton: cell.cancelButton)
        
        //function to handle cancel action
        cell.cancelAction = {
            loader.stopLoading() //Cancel the downloading of image
        }
        return cell
    }
    
    
    // when scrolling reaches to last cell, logic to reload 10 more images
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = fewCards.count-1
        if isScrolling{
            //user reaches to last row
            if indexPath.row == lastElement && fewCards.count != cardArr.count {
                if fewCards.count + END <= cardArr.count{
                    index += END
                    addCards()
                }
                else{
                    fewCards = cardArr
                }
                activityIndicator.isHidden = false
                tableView.reloadData()
            }
        }
    }
    
    //MARK: scroll delegate
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isScrolling = true
    }
}
