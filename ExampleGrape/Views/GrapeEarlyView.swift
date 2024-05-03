//
//  GrapeEarlyView.swift
//  ExampleGrape
//
//  Created by 김승원 on 4/29/24.
//

import SwiftUI



struct GrapeEarlyView: View {
    @ObservedObject var podoalViewModel: PodoalViewModel
    @ObservedObject var listViewModel: ListViewModel

    var body: some View {
        ZStack {
            VStack(spacing: -10) {
                ForEach(podoalViewModel.podoals.indices, id: \.self) { rowIndex in   // 행
                    HStack(spacing: -15) {  // 층
                        ForEach(podoalViewModel.podoals[rowIndex], id: \.id) { podoal in   // 열
                            Circle()
                                .fill(podoal.isCompleted ? Color.green : Color.gray)
                                .stroke(Color.white, lineWidth: 2)
                                .frame(width: 40, height: 40)
                        }
                    }

                }
                Spacer()
            }
            .padding(.top, 10)
        }

        // completedFinish가 변경될 때마다 실행됨
        .onReceive(listViewModel.$completedFinish) { newFinish in
            // 만약 newFinish가 0보다 크고 grape 배열의 총 항목 수보다 작거나 같다면
            if newFinish > 0 && newFinish <= podoalViewModel.podoals.flatMap({ $0 }).count {
                var completedCount = 0 // 완료된 항목의 개수를 변수로 초기화한다.
                for rowIndex in 0..<podoalViewModel.podoals.count {   // grape 배열의 행(row)을 반복한다.
                    for columnIndex in 0..<podoalViewModel.podoals[rowIndex].count {  // 각 헹의 열(column)를 반복한다.
                        // 완료된 항목의 개수가 newFinish보다 작다면
                        if completedCount < newFinish {
                            // 해당 항목의 isCompleted를 true로 설정하고,
                            podoalViewModel.podoals[rowIndex][columnIndex].isCompleted = true
                            // 완료된 항목의 개수를 증가시킨다.
                            completedCount += 1
                        } else {
                            // 그렇지 않으면 해당 항목의 isCompleted를 false로 설정한다.
                            podoalViewModel.podoals[rowIndex][columnIndex].isCompleted = false
                        }
                    }
                }
            } else if newFinish == 0 {
                // 만약 newFinish가 0이라면,
                // grape 배열의 모든 항목의 isCompleted를 false로 설정한다.
                for rowIndex in 0..<podoalViewModel.podoals.count {
                    for columnIndex in 0..<podoalViewModel.podoals[rowIndex].count {
                        podoalViewModel.podoals[rowIndex][columnIndex].isCompleted = false
                    }
                }
            }
        }

    }
}


#Preview {
    GrapeEarlyView(podoalViewModel: PodoalViewModel(), listViewModel: ListViewModel())
}
