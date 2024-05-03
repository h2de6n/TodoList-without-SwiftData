//
//  PodoalModel.swift
//  ExampleGrape
//
//  Created by 김승원 on 5/2/24.
//

import Foundation

struct PodoalModel {
    var id: Int
    var isCompleted: Bool

    init(id: Int, isCompleted: Bool) {
        self.id = id
        self.isCompleted = isCompleted
    }

    func updateCompletion() -> PodoalModel {
        return PodoalModel(id: id, isCompleted: !isCompleted)
    }
}
