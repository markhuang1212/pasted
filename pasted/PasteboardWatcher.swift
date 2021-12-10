//
//  PasteboardWatcher.swift
//  pasted
//
//  Created by Meng on 10/12/2021.
//

import Foundation
import Cocoa

protocol PasteboardWatcherDelegate {
    func NewValueDidArrive(value: String) -> Void
}


class PasteboardWatcher {
    
    private var timer: Timer?
    
    private let pasteboard = NSPasteboard.general
    
    private var changeCount: Int
    
    var delegate: PasteboardWatcherDelegate?
    
    init() {
        changeCount = pasteboard.changeCount
        self.timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] _ in
            guard let self = self else {
                return
            }
            if self.changeCount != self.pasteboard.changeCount {
                self.changeCount = self.pasteboard.changeCount
                if let newValue = self.pasteboard.string(forType: .string) {
                    self.delegate?.NewValueDidArrive(value: newValue)
                }
            }
        }
        
    }
    
}
