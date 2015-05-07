//
//  TutorialVC.swift
//  SightReader
//
//  Created by Katrina Voorhees on 5/3/15.
//  Copyright (c) 2015 Katrina Voorhees. All rights reserved.
//

import UIKit

class TutorialVC: UIViewController {

    @IBOutlet weak var clefImage: UIImageView!
    
    @IBOutlet weak var note1: UIImageView!
    @IBOutlet weak var note2: UIImageView!
    @IBOutlet weak var note3: UIImageView!
    @IBOutlet weak var note4: UIImageView!
    @IBOutlet weak var note5: UIImageView!
    @IBOutlet weak var note6: UIImageView!
    @IBOutlet weak var note7: UIImageView!
    @IBOutlet weak var note8: UIImageView!
    @IBOutlet weak var note9: UIImageView!
    @IBOutlet weak var note10: UIImageView!
    @IBOutlet weak var note11: UIImageView!
    @IBOutlet weak var note12: UIImageView!
    @IBOutlet weak var note13: UIImageView!
    
    @IBOutlet weak var note1b: UIImageView!
    @IBOutlet weak var note2b: UIImageView!
    @IBOutlet weak var note3b: UIImageView!
    @IBOutlet weak var note4b: UIImageView!
    @IBOutlet weak var note5b: UIImageView!
    @IBOutlet weak var note6b: UIImageView!
    @IBOutlet weak var note7b: UIImageView!
    @IBOutlet weak var note8b: UIImageView!
    @IBOutlet weak var note9b: UIImageView!
    @IBOutlet weak var note10b: UIImageView!
    @IBOutlet weak var note11b: UIImageView!
    @IBOutlet weak var note12b: UIImageView!
    @IBOutlet weak var note13b: UIImageView!
    
    @IBOutlet weak var flatNote1: UIImageView!
    @IBOutlet weak var flatNote2: UIImageView!
    @IBOutlet weak var flatNote3: UIImageView!
    @IBOutlet weak var flatNote4: UIImageView!
    @IBOutlet weak var flatNote5: UIImageView!
    @IBOutlet weak var flatNote6: UIImageView!
    @IBOutlet weak var flatNote7: UIImageView!
    @IBOutlet weak var flatNote8: UIImageView!
    @IBOutlet weak var flatNote9: UIImageView!
    @IBOutlet weak var flatNote10: UIImageView!
    @IBOutlet weak var flatNote11: UIImageView!
    @IBOutlet weak var flatNote12: UIImageView!
    @IBOutlet weak var flatNote13: UIImageView!
    
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
    
    @IBOutlet var allNotes: [UIImageView]!
    
    @IBOutlet weak var aKey: OBShapedButton!
    @IBOutlet weak var bKey: OBShapedButton!
    @IBOutlet weak var cKey: OBShapedButton!
    @IBOutlet weak var dKey: OBShapedButton!
    @IBOutlet weak var eKey: OBShapedButton!
    @IBOutlet weak var fKey: OBShapedButton!
    @IBOutlet weak var gKey: OBShapedButton!
    
    @IBOutlet weak var aSharpKey: OBShapedButton!
    @IBOutlet weak var cSharpKey: OBShapedButton!
    @IBOutlet weak var dSharpKey: OBShapedButton!
    @IBOutlet weak var fSharpKey: OBShapedButton!
    @IBOutlet weak var gSharpKey: OBShapedButton!
    
    @IBOutlet var allKeys: [OBShapedButton]!
    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var fButton: UIButton!
    @IBOutlet weak var gButton: UIButton!
    @IBOutlet weak var aSharpButton: UIButton!
    @IBOutlet weak var cSharpButton: UIButton!
    @IBOutlet weak var dSharpButton: UIButton!
    @IBOutlet weak var fSharpButton: UIButton!
    @IBOutlet weak var gSharpButton: UIButton!
    
    @IBOutlet var allButtons: [UIButton]!
    var clef : String = "Treble"
    var displayNote : String = "A"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearDisplay()
        updateDisplay()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    @IBAction func changedClef(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: clef = "Treble"
        case 1: clef = "Bass"
        default: clef = "Treble"
        break;
        }
        clefImage.image = UIImage(named: "\(clef)ClefLayout")
        clearDisplay()
        updateDisplay()
    }

    @IBAction func buttonPressed(sender: UIButton) {
        switch sender {
        case aButton: displayNote = "A"
        case bButton: displayNote = "B"
        case cButton: displayNote = "C"
        case dButton: displayNote = "D"
        case eButton: displayNote = "E"
        case fButton: displayNote = "F"
        case gButton: displayNote = "G"
        case aSharpButton: displayNote = "A#"
        case cSharpButton: displayNote = "C#"
        case dSharpButton: displayNote = "D#"
        case fSharpButton: displayNote = "F#"
        case gSharpButton: displayNote = "G#"
        default: displayNote = ""
            
        }
        clearDisplay()
        updateDisplay()
    }
    
    @IBAction func keyPressed(sender: OBShapedButton) {
        switch sender {
        case aKey: displayNote = "A"
        case bKey: displayNote = "B"
        case cKey: displayNote = "C"
        case dKey: displayNote = "D"
        case eKey: displayNote = "E"
        case fKey: displayNote = "F"
        case gKey: displayNote = "G"
        case aSharpKey: displayNote = "A#"
        case cSharpKey: displayNote = "C#"
        case dSharpKey: displayNote = "D#"
        case fSharpKey: displayNote = "F#"
        case gSharpKey: displayNote = "G#"
        default: displayNote = ""
            
        }
        clearDisplay()
        updateDisplay()
    }
    
    func clearDisplay(){
        for keys in allKeys {
            keys.selected = false
        }
        for notes in allNotes {
            notes.hidden = true
        }
        for buttons in allButtons {
            buttons.layer.borderColor = UIColor.clearColor().CGColor
            buttons.layer.borderWidth = 0
        }
    }

    func updateDisplay(){
    
        switch displayNote {
        case "A": aKey.selected = true
            aButton.layer.borderColor = UIColor.greenColor().CGColor
            aButton.layer.borderWidth = 1
        if clef == "Treble" {
            note6.hidden = false
            note13.hidden = false
            }
        if clef == "Bass" {
            note4.hidden = false
            note11.hidden = false
            }
            
        case "B": bKey.selected = true
            bButton.layer.borderColor = UIColor.greenColor().CGColor
            bButton.layer.borderWidth = 1
        if clef == "Treble" {
            note7.hidden = false
            }
        if clef == "Bass" {
            note5.hidden = false
            note12.hidden = false
            }
            
        case "C": cKey.selected = true
            cButton.layer.borderColor = UIColor.greenColor().CGColor
            cButton.layer.borderWidth = 1
        if clef == "Treble" {
            note1.hidden = false
            note8.hidden = false
        }
        if clef == "Bass" {
            note6.hidden = false
            note13.hidden = false
            }
            
        case "D": dKey.selected = true
            dButton.layer.borderColor = UIColor.greenColor().CGColor
            dButton.layer.borderWidth = 1
        if clef == "Treble" {
            note2.hidden = false
            note9.hidden = false
        }
        if clef == "Bass" {
            note7.hidden = false
            }
            
        case "E": eKey.selected = true
            eButton.layer.borderColor = UIColor.greenColor().CGColor
            eButton.layer.borderWidth = 1
        if clef == "Treble" {
            note3.hidden = false
            note10.hidden = false
        }
        if clef == "Bass" {
            note1.hidden = false
            note8.hidden = false
            }
            
        case "F": fKey.selected = true
            fButton.layer.borderColor = UIColor.greenColor().CGColor
            fButton.layer.borderWidth = 1
        if clef == "Treble" {
            note4.hidden = false
            note11.hidden = false
        }
        if clef == "Bass" {
            note2.hidden = false
            note9.hidden = false
            }
            
        case "G": gKey.selected = true
            gButton.layer.borderColor = UIColor.greenColor().CGColor
            gButton.layer.borderWidth = 1
        if clef == "Treble" {
            note5.hidden = false
            note12.hidden = false
        }
        if clef == "Bass" {
            note3.hidden = false
            note10.hidden = false
            }
            
        case "A#": aSharpKey.selected = true
            aSharpButton.layer.borderColor = UIColor.greenColor().CGColor
            aSharpButton.layer.borderWidth = 1
        if clef == "Treble" {
            //A sharp notes
            note6.hidden = false
            note13.hidden = false
            sharpNote6.hidden = false
            sharpNote13.hidden = false
            
            //B flat notes
            note7b.hidden = false
            flatNote7.hidden = false

        }
        if clef == "Bass" {
            //A sharp notes
            note4.hidden = false
            note11.hidden = false
            sharpNote4.hidden = false
            sharpNote11.hidden = false
            
            //B flat notes
            note5b.hidden = false
            note12b.hidden = false
            flatNote5.hidden = false
            flatNote12.hidden = false
            }
            
        case "C#": cSharpKey.selected = true
            cSharpButton.layer.borderColor = UIColor.greenColor().CGColor
            cSharpButton.layer.borderWidth = 1
        if clef == "Treble" {
            //C sharp notes
            note1.hidden = false
            note8.hidden = false
            sharpNote1.hidden = false
            sharpNote8.hidden = false
            
            //D flat notes
            note2b.hidden = false
            note9b.hidden = false
            flatNote2.hidden = false
            flatNote9.hidden = false
        }
        if clef == "Bass" {
            //C sharp notes
            note6.hidden = false
            note13.hidden = false
            sharpNote6.hidden = false
            sharpNote13.hidden = false
            
            //D flat  notes
            note7b.hidden = false
            flatNote7.hidden = false
            }

        case "D#": dSharpKey.selected = true
            dSharpButton.layer.borderColor = UIColor.greenColor().CGColor
            dSharpButton.layer.borderWidth = 1
        if clef == "Treble" {
            //D sharp notes
            note2.hidden = false
            note9.hidden = false
            sharpNote2.hidden = false
            sharpNote9.hidden = false
            
            //E flat notes
            note3b.hidden = false
            note10b.hidden = false
            flatNote3.hidden = false
            flatNote10.hidden = false
        }
        if clef == "Bass" {
            //D Sharp notes
            note7.hidden = false
            sharpNote7.hidden = false
            
            //E Flat notes
            note8b.hidden = false
            flatNote8.hidden = false
            }
            
        case "F#": fSharpKey.selected = true
            fSharpButton.layer.borderColor = UIColor.greenColor().CGColor
            fSharpButton.layer.borderWidth = 1
        if clef == "Treble" {
            //F sharp notes
            note4.hidden = false
            note11.hidden = false
            sharpNote4.hidden = false
            sharpNote11.hidden = false
            
            //G flat notes
            note5b.hidden = false
            note12b.hidden = false
            flatNote5.hidden = false
            flatNote12.hidden = false
        }
        if clef == "Bass" {
            //F Sharp Notes
            note2.hidden = false
            note9.hidden = false
            sharpNote2.hidden = false
            sharpNote9.hidden = false
            
            //G Flat Notes
            note3b.hidden = false
            note10b.hidden = false
            flatNote3.hidden = false
            flatNote10.hidden = false
            }
            
        case "G#": gSharpKey.selected = true
            gSharpButton.layer.borderColor = UIColor.greenColor().CGColor
            gSharpButton.layer.borderWidth = 1
        if clef == "Treble" {
            //G sharp notes
            note5.hidden = false
            note12.hidden = false
            sharpNote5.hidden = false
            sharpNote12.hidden = false
            
            //A flat notes
            note6b.hidden = false
            note13b.hidden = false
            flatNote6.hidden = false
            flatNote13.hidden = false
        }
        if clef == "Bass" {
            //G sharp notes
            note3.hidden = false
            note10.hidden = false
            sharpNote3.hidden = false
            sharpNote10.hidden = false
            
            //A flat notes
            note4b.hidden = false
            note11b.hidden = false
            flatNote4.hidden = false
            flatNote11.hidden = false
            }

        default: return
        }

    }

}
