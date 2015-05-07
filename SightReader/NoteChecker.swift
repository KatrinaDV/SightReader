//
//  NoteChecker.swift
//  SightReader
//
//  Created by Katrina Voorhees on 4/30/15.
//  Copyright (c) 2015 Katrina Voorhees. All rights reserved.
//

import Foundation

public protocol NoteActions {
    func checkNote() -> Bool
    func randomNote(random: UInt32)
    
    var correctNote : String { get set}
    var userInput : String { get set}
    var statistics : [String: [String: [String: AnyObject]]] {get set}
    var clef: String {get set}
    var currentTotal: Int {get set}
    var currentCorrect: Int{get set}
}

public class Note: NSObject, NoteActions {
    
    
    public var correctNote : String = ""
    public var userInput : String = ""
    public var clef : String = ""
    public var currentTotal: Int = 0
    public var currentCorrect : Int = 0
    
    public var statistics : [String : [String: [String : AnyObject]]] = ["Treble": ["A" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "B" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "C" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "D" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "E" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "F" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "G" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "total" : ["name": "", "correct" : 0, "total": 0, "percent" : 0]], "Bass": ["A" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "B" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "C" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "D" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "E" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "F" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "G" : ["name": "", "correct" : 0, "total": 0, "percent" : 0], "total" : ["name": "", "correct" : 0, "total": 0, "percent" : 0]]]
    
    
    public func checkNote() -> Bool {
        addOneToStat("total", stat: "total")
        currentTotal++
        
        switch correctNote {
        case "A": addOneToStat("A", stat: "total")
        case "B": addOneToStat("B", stat: "total")
        case "C": addOneToStat("C", stat: "total")
        case "D": addOneToStat("D", stat: "total")
        case "E": addOneToStat("E", stat: "total")
        case "F": addOneToStat("F", stat: "total")
        case "G": addOneToStat("G", stat: "total")
        case "A#": addOneToStat("A", stat: "total")
        case "C#": addOneToStat("C", stat: "total")
        case "D#": addOneToStat("D", stat: "total")
        case "F#": addOneToStat("F", stat: "total")
        case "G#": addOneToStat("G", stat: "total")
        case "Ab": addOneToStat("A", stat: "total")
        case "Bb": addOneToStat("B", stat: "total")
        case "Db": addOneToStat("D", stat: "total")
        case "Eb": addOneToStat("E", stat: "total")
        case "Gb": addOneToStat("G", stat: "total")
        default: break;
        }
        
        let flats = ["Ab", "Bb", "Db", "Eb", "Gb"]
        let sharps = ["A#", "C#", "D#", "F#", "G#"]
        
        for flat in flats {
            if correctNote == flat {
                switch userInput {
                    case "A#": userInput = "Bb"
                    case "C#": userInput = "Db"
                    case "D#": userInput = "Eb"
                    case "F#": userInput = "Gb"
                    case "G#": userInput = "Ab"
                default: break;
                }
            }
        }
        
        if userInput == correctNote {
            addOneToStat("total", stat: "correct")
            currentCorrect++
            
            switch correctNote {
            case "A": addOneToStat("A", stat: "correct")
            case "B": addOneToStat("B", stat: "correct")
            case "C": addOneToStat("C", stat: "correct")
            case "D": addOneToStat("D", stat: "correct")
            case "E": addOneToStat("E", stat: "correct")
            case "F": addOneToStat("F", stat: "correct")
            case "G": addOneToStat("G", stat: "correct")
            case "A#": addOneToStat("A", stat: "correct")
            case "C#": addOneToStat("C", stat: "correct")
            case "D#": addOneToStat("D", stat: "correct")
            case "F#": addOneToStat("F", stat: "correct")
            case "G#": addOneToStat("G", stat: "correct")
            case "Ab": addOneToStat("A", stat: "correct")
            case "Bb": addOneToStat("B", stat: "correct")
            case "Db": addOneToStat("D", stat: "correct")
            case "Eb": addOneToStat("E", stat: "correct")
            case "Gb": addOneToStat("G", stat: "correct")
            default: break;
            }
            
            return true
            
        } else {
            return false
        }
    }
    
    func addOneToStat(note: String, stat: String){
        if statistics[clef]![note]![stat] is Int {
            var number : Int = statistics[clef]![note]![stat]! as! Int
            number++
            statistics[clef]![note]![stat]! = number
        }
    }
    
    public func randomNote(random: UInt32) {
        if clef == "Treble" {
            switch (random) {
            case 0: correctNote = "C"
            case 1: correctNote = "D"
            case 2: correctNote = "E"
            case 3: correctNote = "F"
            case 4: correctNote = "G"
            case 5: correctNote = "A"
            case 6: correctNote = "B"
            case 7: correctNote = "C"
            case 8: correctNote = "D"
            case 9: correctNote = "E"
            case 10: correctNote = "F"
            case 11: correctNote = "G"
            case 12: correctNote = "A"
            case 13: correctNote = "C#"
            case 14: correctNote = "D#"
            case 15: correctNote = "E"
            case 16: correctNote = "F#"
            case 17: correctNote = "G#"
            case 18: correctNote = "A#"
            case 19: correctNote = "B"
            case 20: correctNote = "C#"
            case 21: correctNote = "D#"
            case 22: correctNote = "E"
            case 23: correctNote = "F#"
            case 24: correctNote = "G#"
            case 25: correctNote = "A#"
            case 26: correctNote = "C"
            case 27: correctNote = "Db"
            case 28: correctNote = "Eb"
            case 29: correctNote = "F"
            case 30: correctNote = "Gb"
            case 31: correctNote = "Ab"
            case 32: correctNote = "Bb"
            case 33: correctNote = "C"
            case 34: correctNote = "Db"
            case 35: correctNote = "Eb"
            case 36: correctNote = "F"
            case 37: correctNote = "Gb"
            case 38: correctNote = "Ab"
            default: return
            }
        } else if clef == "Bass" {
            switch (random) {
            case 0: correctNote = "E"
            case 1: correctNote = "F"
            case 2: correctNote = "G"
            case 3: correctNote = "A"
            case 4: correctNote = "B"
            case 5: correctNote = "C"
            case 6: correctNote = "D"
            case 7: correctNote = "E"
            case 8: correctNote = "F"
            case 9: correctNote = "G"
            case 10: correctNote = "A"
            case 11: correctNote = "B"
            case 12: correctNote = "C"
            case 13: correctNote = "E"
            case 14: correctNote = "F#"
            case 15: correctNote = "G#"
            case 16: correctNote = "A#"
            case 17: correctNote = "B"
            case 18: correctNote = "C#"
            case 19: correctNote = "D#"
            case 20: correctNote = "E"
            case 21: correctNote = "F#"
            case 22: correctNote = "G#"
            case 23: correctNote = "A#"
            case 24: correctNote = "B"
            case 25: correctNote = "C#"
            case 26: correctNote = "Eb"
            case 27: correctNote = "F"
            case 28: correctNote = "Gb"
            case 29: correctNote = "Ab"
            case 30: correctNote = "Bb"
            case 31: correctNote = "C"
            case 32: correctNote = "Db"
            case 33: correctNote = "Eb"
            case 34: correctNote = "F"
            case 35: correctNote = "Gb"
            case 36: correctNote = "Ab"
            case 37: correctNote = "Bb"
            case 38: correctNote = "C"
            default: return
            }
            
        }
    }
}
