//
//  ContentView.swift
//  ExampleGrape
//
//  Created by 김승원 on 4/29/24.
//

import SwiftUI



struct MainView: View {
    @State private var date = Date()
    @State private var showModal = false
    @StateObject var podoalViewModel: PodoalViewModel
    @StateObject var listViewModel: ListViewModel

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter
    }()

    var body: some View {
        TabView {
            NavigationStack {
                List {
                    Section {
                        VStack {
                            Text("\(date, formatter: dateFormatter)")
                                .font(.system(size: 18))
                                .foregroundStyle(Color.gray)
                                .frame(maxWidth: .infinity, minHeight: 40, alignment: .leading)

                            GrapeEarlyView(podoalViewModel: podoalViewModel, listViewModel: listViewModel)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)

                        }
                    }.frame(height: 250)
                    Section {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItem(item: item)

                                    }
                                }
                        }
                        .onDelete { indexSet in
                            // 여러 함수를 실행하기 위한 클로저 정의
                            let deleteActions = {
                                listViewModel.deleteItem(indexSet: indexSet)
                                podoalViewModel.deletePodoals()
                            }
                            // 클로저 실행
                            deleteActions()
                        }
                        .onMove(perform: listViewModel.moveItem)
                    }

                }

                .navigationTitle("TODO")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        Button {
                            showModal = true
                        } label: {
                            Image(systemName: "plus")
                        })
                .sheet(isPresented: $showModal) {
                    TodoAddView()
                        .environmentObject(listViewModel)
                        .environmentObject(podoalViewModel)
                }
            }

            .tabItem {
                Label("TODO", systemImage: "checkmark.circle.fill")
            }

            AchivementView()
                .tabItem {
                    Label("Achivment", systemImage: "calendar.badge.checkmark")
                }
        }
    }
}

#Preview {
    MainView(podoalViewModel: PodoalViewModel(), listViewModel: ListViewModel())
}
