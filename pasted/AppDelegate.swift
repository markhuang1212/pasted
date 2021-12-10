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
        print("Application Did Finish Launching")
        let contentView = ContentView(pasteDataController: PasteDataController.shared)
        popOver = NSPopover()
        popOver.contentViewController = NSHostingController(rootView: contentView)
        popOver.contentSize = NSSize(width: 360.0, height: 360.0)
        popOver.behavior = .transient
        statusBarController = StatusBarController(popOver: popOver)
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        
    }
    
}
