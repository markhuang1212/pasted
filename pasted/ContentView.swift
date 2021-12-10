//
//  ContentView.swift
//  pasted
//
//  Created by Meng on 10/12/2021.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var pasteDataController: PasteDataController
    
    func deleteItem(withId id: UUID) {
        print("Delete Item with ID \(id)")
        pasteDataController.deleteItem(withId: id)
    }
    
    var body: some View {
        List {
            ForEach(pasteDataController.data) { item in
                HStack {
                    Text(item.dataStr)
                    Spacer()
                    Button(action:{deleteItem(withId: item.id)}) {
                        Image(systemName: "delete.left.fill")
                    }
                }
                Divider()
            }
        }
    }
    
}
