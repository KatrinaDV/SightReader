//
//  PianoKeysGameVC.swift
//  SightReader
//
//  Created by Katrina Voorhees on 4/30/15.
//  Copyright (c) 2015 Katrina Voorhees. All rights reserved.
//

import UIKit

class PianoKeysGameVC: UIViewController {

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
    
    @IBOutlet weak var sharpNote1: UIImageView!
    @IBOutlet weak var sharpNote2: UIImageView!
    @IBOutlet weak var sharpNote3: UIImageView!
    @IBOutlet weak var sharpNote4: UIImageView!
    @IBOutlet weak var sharpNote5: UIImageView!
    @IBOutlet weak var sharpNote6: UIImageView!
    @IBOutlet weak var sharpNote7: UIImageView!
    @IBOutlet weak var sharpNote8: UIImageView!
    @IBOutlet weak var sharpNote9: UIImageView!
    @IBOutlet weak var sharpNote10: UIImageView!
    @IBOutlet weak var sharpNote11: UIImageView!
    @IBOutlet weak var sharpNote12: UIImageView!
    @IBOutlet weak var sharpNote13: UIImageView!
    
    
    @IBOutlet weak var flatNote13: UIImageView!
    @IBOutlet weak var flatNote12: UIImageView!
    @IBOutlet weak var flatNote11: UIImageView!
    @IBOutlet weak var flatNote10: UIImageView!
    @IBOutlet weak var flatNote9: UIImageView!
    @IBOutlet weak var flatNote8: UIImageView!
    @IBOutlet weak var flatNote7: UIImageView!
    @IBOutlet weak var flatNote6: UIImageView!
    @IBOutlet weak var flatNote5: UIImageView!
    @IBOutlet weak var flatNote4: UIImageView!
    @IBOutlet weak var flatNote3: UIImageView!
    @IBOutlet weak var flatNote2: UIImageView!
    @IBOutlet weak var flatNote1: UIImageView!
    
    @IBOutlet var allNotes: [UIImageView]!
    
    @IBOutlet var clefImage: UIImageView!
    
    //outlets for Piano Key buttons
    @IBOutlet weak var a: OBShapedButton!
    @IBOutlet weak var b: OBShapedButton!
    @IBOutlet weak var c: OBShapedButton!
    @IBOutlet weak var d: OBShapedButton!
    @IBOutlet weak var e: OBShapedButton!
    @IBOutlet weak var f: OBShapedButton!
    @IBOutlet weak var g: OBShapedButton!
    @IBOutlet weak var aSharp: OBShapedButton!
    @IBOutlet weak var cSharp: OBShapedButton!
    @IBOutlet weak var dSharp: OBShapedButton!
    @IBOutlet weak var fSharp: OBShapedButton!
    @IBOutlet weak var gSharp: OBShapedButton!

    @IBOutlet var allKeys: [OBShapedButton]!
    
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
        allowAdditionalInput = true
        updateNote()
        for key in allKeys {
            key.selected = false
        }
        correctWrong.hidden = true
        correctNoteLabel.hidden = true
    }

    func updateNote() {

        tapForNewNoteLabel.hidden = true
        
        for notes in allNotes {
            notes.hidden = true
        }
        
        var randomNote = arc4random_uniform(39)
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
        case 13: note1.hidden = false
        if notesactions.clef == "Treble" {
            sharpNote1.hidden = false
            }
        case 14: note2.hidden = false
            sharpNote2.hidden = false
        case 15: note3.hidden = false
        if notesactions.clef == "Bass" {
            sharpNote3.hidden = false
            }
        case 16: note4.hidden = false
            sharpNote4.hidden = false
        case 17: note5.hidden = false
        if notesactions.clef == "Treble" {
            sharpNote5.hidden = false
            }
        case 18: note6.hidden = false
            sharpNote6.hidden = false
        case 19: note7.hidden = false
        if notesactions.clef == "Bass" {
            sharpNote7.hidden = false 
            }
        case 20: note8.hidden = false
        if notesactions.clef == "Treble" {
            sharpNote8.hidden = false
            }
        case 21: note9.hidden = false
            sharpNote9.hidden = false
        case 22: note10.hidden = false
        if notesactions.clef == "Bass" {
            sharpNote10.hidden = false
            }
        case 23: note11.hidden = false
            sharpNote11.hidden = false
        case 24: note12.hidden = false
        if notesactions.clef == "Treble" {
            sharpNote12.hidden = false
            }
        case 25: note13.hidden = false
            sharpNote13.hidden = false
        case 26: note1.hidden = false
        if notesactions.clef == "Bass" {
            flatNote1.hidden = false
            }
        case 27: note2.hidden = false
        if notesactions.clef == "Treble" {
            flatNote2.hidden = false
            }
        case 28: note3.hidden = false
            flatNote3.hidden = false
        case 29: note4.hidden = false
        if notesactions.clef == "Bass" {
            flatNote4.hidden = false
            }
        case 30: note5.hidden = false
            flatNote5.hidden = false
        case 31: note6.hidden = false
        if notesactions.clef == "Treble" {
            flatNote6.hidden = false
            }
        case 32: note7.hidden = false
            flatNote7.hidden = false
        case 33: note8.hidden = false
        if notesactions.clef == "Bass" {
            flatNote8.hidden = false
            }
        case 34: note9.hidden = false
        if notesactions.clef == "Treble" {
            flatNote9.hidden = false
            }
        case 35: note10.hidden = false
            flatNote10.hidden = false
        case 36: note11.hidden = false
        if notesactions.clef == "Bass" {
            flatNote11.hidden = false
            }
        case 37: note12.hidden = false
            flatNote12.hidden = false
        case 38: note13.hidden = false
        if notesactions.clef == "Treble" {
            flatNote13.hidden = false
            }
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


    @IBAction func noteSelected(sender: OBShapedButton) {
        if allowAdditionalInput == true {
            switch (sender) {
            case a: checkNote("A")
            case b: checkNote("B")
            case c: checkNote("C")
            case d: checkNote("D")
            case e: checkNote("E")
            case f: checkNote("F")
            case g: checkNote("G")
            case aSharp: checkNote("A#")
            case cSharp: checkNote("C#")
            case dSharp: checkNote("D#")
            case fSharp: checkNote("F#")
            case gSharp: checkNote("G#")
            default: break;
            }
            sender.selected = true
        }
        allowAdditionalInput = false
    }
    
    func checkNote(note: String){
        notesactions.userInput = note
        correctWrong.hidden = false
        
        if notesactions.checkNote() == true {
            correctWrong.image = UIImage(named: "Correct")
            correctNoteLabel.text = "Yes the correct note is \(notesactions.correctNote)!"
        } else {
            correctWrong.image = UIImage(named: "Wrong")
            correctNoteLabel.text = "You picked \(notesactions.userInput), the correct note is \(notesactions.correctNote)"
        }
        var percent = notesactions.currentCorrect * 100 / notesactions.currentTotal
        percentLabel.text = ("\(percent)%")
        
        correctNoteLabel.hidden = false
        tapForNewNoteLabel.hidden = false
        
        saveGameData()
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
