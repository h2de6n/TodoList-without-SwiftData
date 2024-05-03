//
//  TodoAddView.swift
//  ExampleGrape
//
//  Created by 김승원 on 4/30/24.
//

import SwiftUI

struct TodoAddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @EnvironmentObject var podoalViewModel: PodoalViewModel
    @State private var textFieldText: String = ""

    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {

        NavigationStack {
            VStack {
                TextField("할일을 입력하세요.", text: $textFieldText)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0)
                        .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                    .navigationBarItems(
                        leading: Button("취소", action: {
                            dismiss()
                        }), trailing: Button("추가", action: {
                            saveButtonPressed()
                        }))
            }
            .padding(20)
            Spacer()

                .alert(isPresented: $showAlert, content: getAlert)
        }

    }

    func saveButtonPressed() {
        if textIsApproprivate() {
            listViewModel.addItem(title: textFieldText)
            podoalViewModel.addPodoal()
            presentationMode.wrappedValue.dismiss()
        }
    }

    func textIsApproprivate() -> Bool {
        if textFieldText.utf8.count < 6 {
            alertTitle = "2글자 이상 입력하세요."
            showAlert.toggle()
            return false
        }
        return true
    }

    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    TodoAddView()
}
