//
//  ExampleGrapeApp.swift
//  ExampleGrape
//
//  Created by 김승원 on 4/29/24.
//

import SwiftUI

@main
struct ExampleGrapeApp: App {

    @State var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView(podoalViewModel: PodoalViewModel(), listViewModel: ListViewModel())
            }
//            .environmentObject(listViewModel)
        }
    }
}
