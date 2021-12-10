//
//  QuitButton.swift
//  pasted
//
//  Created by Meng on 11/12/2021.
//

import SwiftUI
import Cocoa

struct QuitButton: View {
    var body: some View {
        Button(action: { NSApp.terminate(self)} ) {
            Text("Quit")
        }
    }
}
