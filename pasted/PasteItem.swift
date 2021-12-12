//
//  PasteItem.swift
//  pasted
//
//  Created by Meng on 10/12/2021.
//

import SwiftUI
import CoreText
import Cocoa

struct PasteItem: View {
    
    @ObservedObject var pasteDataController: PasteDataController
    
    @State var expanded = false
    
    var index: Int
    
    var searchText = ""
    
    var item: PasteData
    
    func deleteItem() {
        print("Delete Item with ID \(item.id)")
        pasteDataController.deleteItem(withId: item.id)
    }
    
    func putItemToPasteboard() {
        pasteDataController.putItemToPasteboard(itemId: item.id)
    }
    
    func formatedDataStr() -> AttributedString {
        let attrStr = NSMutableAttributedString(string: item.dataStr)
        let range = attrStr.mutableString.range(of: searchText, options: .caseInsensitive)
        attrStr.addAttributes([.backgroundColor: NSColor.red], range: range)
        return AttributedString(attrStr)
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                if expanded {
                    Text(item.lastUsed.description)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Button(action: {expanded.toggle()}) {
                    Text(formatedDataStr())
                        .lineLimit(expanded ? nil : 4)
                }
                .buttonStyle(.plain)
            }
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
