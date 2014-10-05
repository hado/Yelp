//
//  YelpCell.swift
//  Yelp
//
//  Created by Ha on 10/1/14.
//  Copyright (c) 2014 Ha. All rights reserved.
//

import UIKit

class YelpCell: UITableViewCell {

    @IBOutlet weak var yelpImage: UIImageView!
    @IBOutlet weak var yelpName: UILabel!
    @IBOutlet weak var yelpReview: UILabel!
    @IBOutlet weak var yelpRating: UIImageView!
    @IBOutlet weak var yelpLocation: UILabel!
    @IBOutlet weak var yelpTags: UILabel!
    @IBOutlet weak var yelpDistance: UILabel!
    @IBOutlet weak var yelpPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
