//
//  PastDataControllew.swift
//  pasted
//
//  Created by Meng on 10/12/2021.
//

import Foundation
import AppKit


class PasteDataController: ObservableObject, PasteboardWatcherDelegate {
    
    static var shared = PasteDataController()
    
    var pasteBoardWatcher = PasteboardWatcher()
    
    @Published var data: [PasteData]
    
    init() {
        self.data = pasteData
        pasteBoardWatcher.delegate = self
    }
    
    func NewValueDidArrive(value: String) {
        if !data.contains(where: { $0.dataStr == value}) {
            addItem(PasteData(dataStr: value))
        } else {
            print("Value already exist")
        }
    }
    
    func putItemToPasteboard(itemId id: UUID) {
        let index = data.firstIndex(where: {$0.id == id})!
        data.move(fromOffsets: IndexSet(integer: index), toOffset: 0)
        NSPasteboard.general.declareTypes([.string], owner: nil)
        NSPasteboard.general.setString(data[0].dataStr, forType: .string)
    }
    
    func deleteItem(withId id: UUID) {
        data = data.filter {
            $0.id != id
        }
    }
    
    func addItem(_ item: PasteData) {
        data.append(item)
    }
    
}

