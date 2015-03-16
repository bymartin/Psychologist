//
//  PsychologistViewController.swift
//  Psychologist
//
//  Created by Barry Martin on 3/15/15.
//  Copyright (c) 2015 BAMsoft. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController
{
    
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // change below because we embedded faceview in navigation view
        // controller to get title bar
        // This code is nice in that it will work in either case:
        // where we may or may not have the view inside nav controller
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
        //if let hvc = segue.destinationViewController as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "sad": hvc.happiness = 0
                    case "happy": hvc.happiness = 100
                    case "nothing": hvc.happiness = 25
                default: hvc.happiness = 50
                }
            }
        }
    }


}

