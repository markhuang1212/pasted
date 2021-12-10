//
//  AppDelegate.swift
//  pasted
//
//  Created by Meng on 10/12/2021.
//

import Foundation
import Cocoa
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var popOver: NSPopover!
    var statusBarController: StatusBarController!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentView = ContentView(pasteDataController: PasteDataController.shared)
        
        popOver = NSPopover()
        popOver.contentSize = NSSize(width: 360.0, height: 360.0)
        popOver.behavior = .transient
        popOver.contentViewController = NSHostingController(rootView: contentView)
        
        statusBarController = StatusBarController(popOver: popOver)
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        
    }
    
}
