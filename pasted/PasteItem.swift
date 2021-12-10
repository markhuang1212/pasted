//
//  PasteItem.swift
//  pasted
//
//  Created by Meng on 10/12/2021.
//

import SwiftUI

struct PasteItem: View {
    
    @StateObject var pasteDataController: PasteDataController
    
    @State var expanded = false
    
    var item: PasteData
    
    func deleteItem() {
        print("Delete Item with ID \(item.id)")
        pasteDataController.deleteItem(withId: item.id)
    }
    
    func putItemToPasteboard() {
        pasteDataController.putItemToPasteboard(itemId: item.id)
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Button(action: {expanded.toggle()}) {
                Text(item.dataStr)
                    .lineLimit(expanded ? nil : 4)
            }
            .buttonStyle(.plain)
            Spacer()
            Button(action: { putItemToPasteboard() }) {
                Image(systemName: "doc.on.doc.fill")
            }
            .buttonStyle(.borderless)
            Button(action: { deleteItem() }) {
                Image(systemName: "delete.left.fill")
            }
            .buttonStyle(.borderless)
        }
        Divider()
    }
    
}
