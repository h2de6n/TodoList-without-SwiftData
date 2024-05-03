//
//  ItemModel.swift
//  ExampleGrape
//
//  Created by 김승원 on 4/30/24.
//

import Foundation

// Immutable Struct
struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool

    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }

    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }

}


