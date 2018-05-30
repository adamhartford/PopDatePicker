//
//  PopDatePicker.swift
//  PopDatePicker
//
//  Created by Adam Hartford on 4/22/15.
//  Copyright (c) 2015 Adam Hartford. All rights reserved.
//

import AppKit

final class PopDatePicker: NSDatePicker {
    
    let controller = PopDatePickerController()
    let popover = NSPopover()
    var showingPopover = false
    
    open var preferredPopoverEdge = NSRectEdge.maxX
    open var shouldShowPopover = { return true }
    
    open override func awakeFromNib() {
        action = #selector(PopDatePicker.dateAction)
        controller.datePicker.action = #selector(PopDatePicker.popoverDateAction)
        controller.datePicker.bind(NSBindingName.value, to: self, withKeyPath: "dateValue", options: nil)
        popover.contentViewController = controller
        popover.behavior = .semitransient
    }
    
    @objc func popoverDateAction() {
        if let bindingInfo = infoForBinding(NSBindingName.value) {
            printView(bindingInfo)

//            if let keyPath = bindingInfo.value(forKey: NSObservedKeyPathKey) as? String {
//                (bindingInfo.value(forKey: NSObservedObjectKey) as AnyObject).setValue(dateValue, forKeyPath: keyPath)
//            }
        }
    }
    
    @objc func dateAction() {
        controller.datePicker.dateValue = dateValue
    }
    
    open override func mouseDown(with theEvent: NSEvent) {
        _ = becomeFirstResponder()
        super.mouseDown(with: theEvent)
    }
    
    open override func becomeFirstResponder() -> Bool {
        if shouldShowPopover() {
            showingPopover = true
            controller.datePicker.dateValue = dateValue
            popover.show(relativeTo: bounds, of: self, preferredEdge: preferredPopoverEdge)
            showingPopover = false
        }
        return super.becomeFirstResponder()
    }
    
    open override func resignFirstResponder() -> Bool {
        if showingPopover {
            return false
        }
        popover.close()
        return super.resignFirstResponder()
    }
}

class PopDatePickerController: NSViewController {
    
    let datePicker: NSDatePicker
    
    required init?(coder: NSCoder) {
        datePicker = NSDatePicker()
        super.init(coder: coder)
    }
    
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        datePicker = NSDatePicker(frame: NSMakeRect(22, 17, 139, 148))
        super.init(nibName: nil, bundle: nil)
        
        let popoverView = NSView(frame: NSMakeRect(0, 0, 180, 180))
        datePicker.datePickerStyle = .clockAndCalendarDatePickerStyle
        datePicker.drawsBackground = false
        let cell = datePicker.cell as? NSDatePickerCell
        cell?.isBezeled = false
        cell?.sendAction(on: NSEvent.EventTypeMask(rawValue: UInt64(Int(NSEvent.EventType.leftMouseDown.rawValue))))
        popoverView.addSubview(datePicker)
        view = popoverView
    }
    
}
