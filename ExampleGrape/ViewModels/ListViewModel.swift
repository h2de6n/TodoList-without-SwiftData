//
//  ListViewModel.swift
//  ExampleGrape
//
//  Created by 김승원 on 5/1/24.
//

import Foundation

class ListViewModel: ObservableObject {

    @Published var items: [ItemModel] = []
    @Published var completedFinish: Int = 0 // complete 카운터 변수

    init() {
        getItems()
    }

    func getItems() {
        let newItems: [ItemModel] =  []
        items.append(contentsOf: newItems)
    }

    func deleteItem(indexSet: IndexSet) {
        for index in indexSet {
            if items[index].isCompleted {
                completedFinish -= 1
            }
        }
        items.remove(atOffsets: indexSet)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }

    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
            if items[index].isCompleted  {
                completedFinish += 1
            } else {
                completedFinish -= 1
            }

        }
    }


}
