//
//  ViewController.swift
//  PopDatePicker Demo
//
//  Created by Adam Hartford on 4/22/15.
//  Copyright (c) 2015 Adam Hartford. All rights reserved.
//

import AppKit

class ViewController: NSViewController  , NSDatePickerCellDelegate {
    
    @IBOutlet weak var datePicker: PopDatePicker!
    @IBOutlet weak var showPopoverButton: NSButton!
    @IBOutlet weak var label: NSTextField!

    let formatterDate: DateFormatter = {
        let _formatter = DateFormatter()
        _formatter.dateFormat = "dd-MM-yy"
        return _formatter
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.dateValue = Date()
        datePicker.shouldShowPopover = { [weak self] in
            return self?.showPopoverButton.state == .on
        }
        datePicker.delegate = self

    }
    
    func datePickerCell(_ datePickerCell: NSDatePickerCell, validateProposedDateValue proposedDateValue: AutoreleasingUnsafeMutablePointer<NSDate>, timeInterval proposedTimeInterval: UnsafeMutablePointer<TimeInterval>?) {

        let date1 = proposedDateValue.pointee
        let dateString = formatterDate.string(from: date1 as Date)
        print (dateString)
        
        label.stringValue = dateString
    }

    
    @IBAction func preferredEdgeChanged(_ sender: NSPopUpButton) {
        switch sender.indexOfSelectedItem {
        case 0:
            datePicker.preferredPopoverEdge = .maxX
        case 1:
            datePicker.preferredPopoverEdge = .minX
        case 2:
            datePicker.preferredPopoverEdge = .maxY
        case 3:
            datePicker.preferredPopoverEdge = .minY
        default:
            break
            
        }
    }

}

