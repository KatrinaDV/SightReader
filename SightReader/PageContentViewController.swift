//
//  PageContentViewController.swift
//  howtoplaytutorial
//
//  Created by Katrina Voorhees on 5/1/15.
//  Copyright (c) 2015 Katrina Voorhees. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    var pageIndex: Int?
    var titleText : String!
    var imageName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundImageView.image = UIImage(named: imageName)
        self.titleLabel.text = titleText
        self.titleLabel.alpha = 0.1
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.titleLabel.alpha = 1.0
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
