//
//  YelpViewController.swift
//  Yelp
//
//  Created by Ha on 9/30/14.
//  Copyright (c) 2014 Ha. All rights reserved.
//

import UIKit

class YelpViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var yelpTableView: UITableView!
    
    var businesses:[NSDictionary]=[]
    
    var client: YelpClient!
    
    // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
    let yelpConsumerKey = "M53ewyueyG-gzeTVUcqjag"
    let yelpConsumerSecret = "4OZFl2EOpQS7A5maqRcijBEqfaw"
    let yelpToken = "18K-4PLaZB4Jgsju2XV8gV4BdPXXn0wt"
    let yelpTokenSecret = "352JGYWdSoSkuVoo4RfiAMagat0"
    

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yelpTableView.delegate = self
        yelpTableView.dataSource = self

        // Do any additional setup after loading the view.
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        
        client.searchWithTerm("Thai", success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            println(response)
            
            self.businesses = response["businesses"] as [NSDictionary]
            self.yelpTableView.reloadData()
            
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("YelpCell") as YelpCell
        var business: NSDictionary = NSDictionary()
        business = self.businesses[indexPath.row]
        
        cell.yelpName.text = business["name"] as? String
        
        var yelpImageURL = business["image_url"] as String
        println(yelpImageURL)
        cell.yelpImage.setImageWithURL(NSURL(string: yelpImageURL))
        cell.yelpImage.layer.cornerRadius = 4
        cell.yelpImage.clipsToBounds = true

        var yelpRatingURL = business["rating_img_url_large"] as String
        println(yelpRatingURL)
        cell.yelpRating.setImageWithURL(NSURL(string: yelpRatingURL))
        
        var review_count = business["review_count"] as Int
        cell.yelpReview.text = String(review_count) + " Reviews"
        
        var location = business["location"] as NSDictionary
        var address = location["address"] as NSArray
        cell.yelpLocation.text = address.firstObject as? String
        
        cell.yelpTags.text = "Thai"
        
        var distance = business["distance"] as? Float
        distance = distance! * 0.000621371
        cell.yelpDistance.text = String(format: "%.02f", distance!) + " mi"
        
        cell.yelpPrice.text = "$$"
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
