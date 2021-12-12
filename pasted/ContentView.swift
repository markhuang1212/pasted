//
//  ContentView.swift
//  pasted
//
//  Created by Meng on 10/12/2021.
//

import Foundation
import SwiftUI
import Cocoa

struct ContentView: View {
    
    @ObservedObject var pasteDataController: PasteDataController
    
    @State var searchText: String = ""
    
    func getFilteredList() -> [PasteData] {
        if searchText.isEmpty {
            return pasteDataController.data
        } else {
            return pasteDataController.data.filter { $0.dataStr.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        if pasteDataController.data.isEmpty {
            VStack {
                Spacer()
                Text("Empty")
                    .font(.title)
                Spacer()
                QuitButton()
                    .padding()
            }
            .frame(width: 360, height: 360)
        } else {
            VStack(spacing: 0) {
                Text("pasted")
                    .font(.headline)
                    .frame(height: 24)
                TextField("Search", text: $searchText)
                    .padding([.horizontal])
                ScrollView {
                    VStack {
                        ForEach(getFilteredList()) { item in
                            PasteItem(pasteDataController: pasteDataController, index: 0, searchText: searchText, item: item)
                        }
                        HStack {
                            QuitButton()
                                .padding()
                        }
                    }
                    .padding()
                    .animation(.easeInOut(duration: 0.3), value: pasteDataController.data.count)
                }
            }
        }
    }
}
