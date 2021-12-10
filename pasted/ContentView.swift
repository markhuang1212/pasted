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
    
    var body: some View {
        if pasteDataController.data.isEmpty {
            HStack{
                Text("Empty")
                    .font(.title)
            }
            .frame(width: 360, height: 360)
        } else {
            VStack {
                Text("pasted")
                    .font(.headline)
                    .padding([.top], 6)
                List {
                    ForEach(pasteDataController.data) { item in
                        PasteItem(pasteDataController: pasteDataController, item: item)
                    }
                }
            }
        }

    }
    
}
