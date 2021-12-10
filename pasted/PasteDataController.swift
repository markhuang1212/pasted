//
//  PastDataControllew.swift
//  pasted
//
//  Created by Meng on 10/12/2021.
//

import Foundation

var pasteData = [
    PasteData(dataStr: "Hello"),
    PasteData(dataStr: "Hi There!")
]

struct PasteData: Identifiable {
    var id = UUID()
    var dataStr: String
}

class PasteDataController: ObservableObject, PasteboardWatcherDelegate {
    
    func NewValueDidArrive(value: String) {
        addItem(PasteData(dataStr: value))
    }
    
    static var shared = PasteDataController()
    
    var pasteBoardWatcher = PasteboardWatcher()
    
    @Published var data: [PasteData]
    
    init() {
        self.data = pasteData
        pasteBoardWatcher.delegate = self
    }
    
    func deleteItem(withId id: UUID) {
        data = data.filter {
            $0.id != id
        }
    }
    
    func addItem(_ item: PasteData) {
        data.append(item)
    }
    
    func save() {
        
    }
    
    func load() {
        
    }
    
}

