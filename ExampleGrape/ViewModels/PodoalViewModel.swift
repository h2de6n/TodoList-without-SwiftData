//
//  PodoalViewModel.swift
//  ExampleGrape
//
//  Created by 김승원 on 5/2/24.
//

import Foundation

class PodoalViewModel: ObservableObject {
    @Published var podoals: [[PodoalModel]] = [[]]
    var currentId: Int = 1

    // 총 항목 개수를 반환하는 계산된 프로퍼티
    var totalItemCount: Int {
        podoals.reduce(0) { $0 + $1.count }
    }

    func deletePodoals() {
        guard !podoals.isEmpty else { return }
        podoals[podoals.endIndex - 1].removeLast()

        if podoals[podoals.endIndex - 1].isEmpty {
            podoals.removeLast()
        }
    }

    func addPodoal() {
        // 배열의 총 항목 수를 계산합니다.
        let totalItemCount = podoals.reduce(0) { $0 + $1.count }
        // 총 항목 수가 15를 초과하는지 확인합니다.
        if totalItemCount >= 15 {
            return // 총 항목 수가 15를 초과하면 더 이상 배열을 생성하지 않습니다.
        }
        if podoals[podoals.endIndex - 1].count >= (6 - podoals.count) {
            podoals.append([])
        }
        let newItem = PodoalModel(id: currentId, isCompleted: false)
        podoals[podoals.endIndex - 1].append(newItem)
        currentId += 1

    }
}
