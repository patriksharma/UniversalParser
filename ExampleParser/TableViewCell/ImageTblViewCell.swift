//
//  ImageTblViewCell.swift
//  ExampleParser
//
//  Created by prateek sharma on 23/04/19.
//  Copyright © 2019 PrateekSharma. All rights reserved.
//

import UIKit

class ImageTblViewCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var mainImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    var cancelAction: (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        cancelAction?()
    }
    
}
