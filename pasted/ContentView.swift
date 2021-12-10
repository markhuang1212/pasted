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
    
    var body: some View {
        List {
            ForEach(pasteDataController.data) { item in
                PasteItem(pasteDataController: pasteDataController, item: item)
            }
        }
    }
    
}
