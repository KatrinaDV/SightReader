//
//  NotesByNameGameVC.swift
//  SightReader
//
//  Created by Katrina Voorhees on 4/30/15.
//  Copyright (c) 2015 Katrina Voorhees. All rights reserved.
//

import UIKit

class NotesByNameGameVC: UIViewController {

    var notesactions : NoteActions = Note()
    var allowAdditionalInput : Bool = true
    
    @IBOutlet var correctWrong: UIImageView!
    
    @IBOutlet var percentLabel: UILabel!
    
    @IBOutlet weak var correctNoteLabel: UILabel!
    
    @IBOutlet weak var tapForNewNoteLabel: UILabel!
    
    //notes numbered from bottom to top of position on the clef
    @IBOutlet var note13: UIImageView!
    @IBOutlet var note12: UIImageView!
    @IBOutlet var note11: UIImageView!
    @IBOutlet var note10: UIImageView!
    @IBOutlet var note9: UIImageView!
    @IBOutlet var note8: UIImageView!
    @IBOutlet var note7: UIImageView!
    @IBOutlet var note6: UIImageView!
    @IBOutlet var note5: UIImageView!
    @IBOutlet var note4: UIImageView!
    @IBOutlet var note3: UIImageView!
    @IBOutlet var note2: UIImageView!
    @IBOutlet var note1: UIImageView!
    
    @IBOutlet var allNotes: [UIImageView]!
    
    @IBOutlet var clefImage: UIImageView!
    
    @IBOutlet var allButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clefImage.image = UIImage(named: "TrebleClefLayout")
        notesactions.clef = "Treble"
        for notes in allNotes {
            notes.hidden = true
        }
        correctNoteLabel.hidden = true
        tapForNewNoteLabel.hidden = true
        loadGameStats()
        updateNote()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    @IBAction func didTap(sender: AnyObject) {
        updateNote()
        for button in allButtons {
            button.layer.borderWidth = 0
        }
    }
    
    func updateNote() {
        allowAdditionalInput = true
        correctWrong.hidden = true
        correctNoteLabel.hidden = true
        tapForNewNoteLabel.hidden = true
        for notes in allNotes {
            notes.hidden = true
        }
        
        var randomNote = arc4random_uniform(13)
        notesactions.randomNote(randomNote)
        switch (randomNote) {
        case 0: note1.hidden = false
        case 1: note2.hidden = false
        case 2: note3.hidden = false
        case 3: note4.hidden = false
        case 4: note5.hidden = false
        case 5: note6.hidden = false
        case 6: note7.hidden = false
        case 7: note8.hidden = false
        case 8: note9.hidden = false
        case 9: note10.hidden = false
        case 10: note11.hidden = false
        case 11: note12.hidden = false
        case 12: note13.hidden = false
        default: return
        }
        var printout = notesactions.correctNote
        println("\(printout)")
    }
    
    
    @IBAction func clefChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: notesactions.clef = "Treble"
        case 1: notesactions.clef = "Bass"
        default: notesactions.clef = "Treble"
        break;
        }
        updateNote()
        clefImage.image = UIImage(named: "\(notesactions.clef)ClefLayout")
    }
    
    @IBAction func noteSelected(sender: UIButton) {
        displayCorrect()
        if allowAdditionalInput == true {
            if let text = sender.titleLabel?.text {
                notesactions.userInput = text
                correctWrong.hidden = false
                
                if notesactions.checkNote() == true {
                    correctWrong.image = UIImage(named: "Correct")
                    correctNoteLabel.text = "Yes the correct note is \(notesactions.correctNote)!"
                } else {
                    correctWrong.image = UIImage(named: "Wrong")
                    sender.layer.borderColor = UIColor.redColor().CGColor
                    sender.layer.borderWidth = 1.0
                    correctNoteLabel.text = "You picked \(notesactions.userInput), the correct note is \(notesactions.correctNote)"
                }
                var percent = notesactions.currentCorrect * 100 / notesactions.currentTotal
                percentLabel.text = ("\(percent)%")
                
                correctNoteLabel.hidden = false
                tapForNewNoteLabel.hidden = false
                
                saveGameData()
            }
        }
        allowAdditionalInput = false
    }
    
    func displayCorrect() {
        if allowAdditionalInput == true {
            for button in allButtons {
                if button.titleLabel?.text == notesactions.correctNote {
                    button.layer.borderColor = UIColor.greenColor().CGColor
                    button.layer.borderWidth = 1.0
                }
            }
        }
    }
    
    func loadGameStats() {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths[0] as! String
        let path = documentsDirectory.stringByAppendingPathComponent("Stats.plist")
        let fileManager = NSFileManager.defaultManager()
        
        if (!fileManager.fileExistsAtPath(path)) {
            if let bundlePath =
                NSBundle.mainBundle().pathForResource("Stats", ofType: "plist") {
                    let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
                    println("Bundle Statistics.plist file is --> \(resultDictionary?.description)")
                    fileManager.copyItemAtPath(bundlePath, toPath: path, error: nil)
                    println("copy")
            } else {
                println("Stats.plist not found. Please, make sure it is part of the bundle.")
            }
        } else {
            println("Stats.plist already exits at path.")
            // use this to delete file from documents directory
            //   fileManager.removeItemAtPath(path, error: nil)
        }
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        println("Loaded Stats.plist file is --> \(resultDictionary?.description)")
        var myDict = NSDictionary(contentsOfFile: path)
        if let dict = myDict {
            //loading values
            var statisticsDict = dict.objectForKey("Running Totals") as! [String: [String : [String : AnyObject]]]
            notesactions.statistics = statisticsDict
            println(statisticsDict)
            //...
        } else {
            println("WARNING: Couldn't create dictionary from GameData.plist! Default values will be used!")
        }
    }
    
    func saveGameData() {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("Stats.plist")
        var dict: NSMutableDictionary = ["XInitializerItem": "DoNotEverChangeMe"]
        //saving values
        dict.setObject(notesactions.statistics, forKey: "Running Totals")
        //...
        //writing to plist
        dict.writeToFile(path, atomically: false)
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        println("Saved Stats.plist file is --> \(resultDictionary?.description)")
    }
}
