//
//  PasteData.swift
//  pasted
//
//  Created by Meng on 10/12/2021.
//

import Foundation

struct PasteData: Identifiable {
    var id = UUID()
    var dataStr: String
    var hashValue: Int {
        get {
            return dataStr.hashValue
        }
    }
}

var pasteData = [
    PasteData(dataStr: "Hello"),
    PasteData(dataStr: "Hi There!"),
    PasteData(dataStr:
"""
Hi!
And
Welcome!!!
This string has
MANY
lines
"""),
    PasteData(dataStr: "LLLLLLLLLLong LLLLLLLLLLong LLLLLLLLLLong LLLLLLLLLLong LLLLLLLLLLong LLLLLLLLLLong LLLLLLLLLLong LLLLLLLLLLong LLLLLLLLLLong")
]

