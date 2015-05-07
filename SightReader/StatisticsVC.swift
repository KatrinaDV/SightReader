//
//  StatisticsVC.swift
//  SightReader
//
//  Created by Katrina Voorhees on 4/30/15.
//  Copyright (c) 2015 Katrina Voorhees. All rights reserved.
//

import UIKit

class StatisticsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var statistics = [String: [String:[String : AnyObject]]]()
    var treble = [String: [String: AnyObject]]()
    var bass = [String: [String: AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStats()
        treble = statistics["Treble"]!
        bass = statistics["Bass"]!
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! CustomHeaderCell
        
        switch (section) {
        case 0:
            headerCell.clefLabel.text = "Treble Clef"
            headerCell.clefIcon.image = UIImage(named: "TrebleClefButton")
        case 1:
            headerCell.clefLabel.text = "Bass Clef"
            headerCell.clefIcon.image = UIImage(named: "BassClefButton")
        default:
            headerCell.textLabel!.text = ""
            headerCell.clefIcon.image = UIImage(named: "")
        }
        
        return headerCell
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("mycell") as! CustomStatsCell
        var clef: String = ""
        switch(indexPath.section){
        case 0:
            clef = "Treble"
        case 1:
            clef = "Bass"
        default: clef = ""
        }
        
        var note : String = ""
        
        switch(indexPath.row){
        case 0: note = "total"
        case 1: note = "A"
        case 2: note = "B"
        case 3: note = "C"
        case 4: note = "D"
        case 5: note = "E"
        case 6: note = "F"
        case 7: note = "G"
        default: note = ""
        }
        
        var percent : Int = percentCalculator(clef, note: note)
        
        cell.noteName.text = "\(note): \(percent)%"
        
        var fractionalProgress = Float(percent) / 100
        cell.barProgressView.setProgress(fractionalProgress, animated: false)
        if fractionalProgress < 0.25 {
            cell.barProgressView.tintColor = UIColor.redColor()
        } else if fractionalProgress >= 0.25 && fractionalProgress < 0.50 {
            cell.barProgressView.tintColor = UIColor.orangeColor()
        } else if fractionalProgress >= 0.50 && fractionalProgress < 0.75 {
            cell.barProgressView.tintColor = UIColor.yellowColor()
        } else {
            cell.barProgressView.tintColor = UIColor.greenColor()
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func percentCalculator(clef: String, note: String) -> Int {
        var percent : Int = 0
        var total : Int = statistics["\(clef)"]!["\(note)"]!["total"]! as! Int
        var correct : Int = statistics["\(clef)"]!["\(note)"]!["correct"] as! Int
        if total != 0 {
            percent = correct * 100 / total
        } else if total == 0 {
            percent = 0
        }
        return percent
    }
    
    var selected : Int = 0
    
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        selected = indexPath.row
        performSegueWithIdentifier("tutorialSegue", sender: indexPath)
        
    }
    
    func gameStats() {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths[0] as! String
        let path = documentsDirectory.stringByAppendingPathComponent("Stats.plist")
        let fileManager = NSFileManager.defaultManager()
        
        if (!fileManager.fileExistsAtPath(path)) {
            if let bundlePath =
                NSBundle.mainBundle().pathForResource("Stats", ofType: "plist") {
                    let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
                    println("Bundle Stats.plist file is --> \(resultDictionary?.description)")
                    fileManager.copyItemAtPath(bundlePath, toPath: path, error: nil)
                    println("copy")
            } else {
                println("Stats.plist not found. Please, make sure it is part of the bundle.")
            }
        } else {
            println("Stats.plist already exits at path.")
            // use this to delete file from documents directory
            //                        fileManager.removeItemAtPath(path, error: nil)
        }
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        println("Loaded Stats.plist file is --> \(resultDictionary?.description)")
        var myDict = NSDictionary(contentsOfFile: path)
        if let dict = myDict {
            //loading values
            var statisticsDict = dict.objectForKey("Running Totals") as! [String: [String : [String : AnyObject]]]
            statistics = statisticsDict
            println(statisticsDict)
            //...
        } else {
            println("WARNING: Couldn't create dictionary from GameData.plist! Default values will be used!")
        }
    }
    
    //MARK: - Navigation
    var notes = ["Total", "A", "B", "C", "D", "E", "F", "G"]
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "tutorialSegue" {
            
            if let destination = segue.destinationViewController as? ExtraInfoVC {
                destination.noteName = notes[selected]
                
            }
        }
    }
    
}
