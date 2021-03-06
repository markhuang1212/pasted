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
    var statusItemButton: NSStatusBarButton
    
    var popOver: NSPopover

    init(popOver: NSPopover) {
        self.popOver = popOver
        statusBar = NSStatusBar.system
        statusItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
        statusItemButton = statusItem.button!
        statusItemButton.image = NSImage(systemSymbolName: "doc.on.clipboard", accessibilityDescription: nil)
        statusItemButton.action = #selector(handleStatusItemButtonAction(_:))
        statusItemButton.sendAction(on: [.rightMouseUp, .leftMouseUp])
        statusItemButton.target = self
    }
    
    @objc func handleStatusItemButtonAction(_ sender: AnyObject?) {
        if (popOver.isShown) {
            popOver.performClose(sender)
        } else {
            NSApp.activate(ignoringOtherApps: true)
            popOver.show(relativeTo: statusItemButton.bounds, of: statusItemButton, preferredEdge: .minY)
        }
    }
}
