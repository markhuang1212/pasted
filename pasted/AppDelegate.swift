//
//  AppDelegate.swift
//  pasted
//
//  Created by Meng on 10/12/2021.
//

import Foundation
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow!
    var statusBarController: StatusBarController!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("Application Did Finish Launching")
        statusBarController = StatusBarController()
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        
    }
    
}
