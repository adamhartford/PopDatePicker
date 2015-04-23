//
//  ViewController.swift
//  PopDatePicker Demo
//
//  Created by Adam Hartford on 4/22/15.
//  Copyright (c) 2015 Adam Hartford. All rights reserved.
//

import Cocoa
import PopDatePicker

class ViewController: NSViewController {
    
    @IBOutlet weak var datePicker: PopDatePicker!
    @IBOutlet weak var showPopoverButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.dateValue = NSDate()
        
        datePicker.shouldShowPopover = { [weak self] in
            return self?.showPopoverButton.state == NSOnState
        }
    }
    
    @IBAction func preferredEdgeChanged(sender: NSPopUpButton) {
        switch sender.indexOfSelectedItem {
        case 0:
            datePicker.preferredPopoverEdge = NSMaxXEdge
        case 1:
            datePicker.preferredPopoverEdge = NSMinXEdge
        case 2:
            datePicker.preferredPopoverEdge = NSMaxYEdge
        case 3:
            datePicker.preferredPopoverEdge = NSMinYEdge
        default:
            break
            
        }
    }

}

