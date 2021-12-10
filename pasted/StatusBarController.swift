//
//  StatusBarController.swift
//  pasted
//
//  Created by Meng on 10/12/2021.
//

import Foundation
import Cocoa

class StatusBarController {
    
    var statusBar: NSStatusBar
    var statusItem: NSStatusItem
    
    init() {
        statusBar = NSStatusBar.system
        statusItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
        statusItem.button?.title = "🙂"
    }
}
