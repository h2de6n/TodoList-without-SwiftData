//
//  ListRowView.swift
//  ExampleGrape
//
//  Created by 김승원 on 4/30/24.
//

import SwiftUI

struct ListRowView: View {

    let item: ItemModel

    var body: some View {

        HStack {
            Circle()
                .stroke(Color.gray, lineWidth: 1)
                .fill(item.isCompleted ? Color.green : Color.white)
                .frame(width: 20, height: 20)

            Text(item.title)
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


struct ListRowView_Previews: PreviewProvider {

    static var item1 = ItemModel(title: "first item!", isCompleted: false)
    static var item2 = ItemModel(title: "second item!", isCompleted: true)

    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
