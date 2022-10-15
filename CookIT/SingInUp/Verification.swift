//
//  Verification.swift
//  CookIT
//
//  Created by Macbook on 15/10/2022.
//

import SwiftUI

struct VerificationView: View {
    @State var successVerificationView = false
    var body: some View {
        VStack {
            if self.successVerificationView {
                ContentView()
            } else {
                SingInUp(noLoginView: $successVerificationView)
            }
        }
    }
}


struct Verification: View {
    @State var userVerificationCode: String = ""
    @State private var numberOfCells: Int = 6
    @State private var currentlySelectedCell = 0
    
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            Text("Verification")
                .font(.largeTitle.bold())
                .foregroundColor(Color("green"))
                .padding()
            Text("Enter the verification code which you should receive on you email")
                .font(.body.bold())
                .foregroundColor(.black)
                .padding()
            HStack {
                SuperTextField(placeholder: "Code", text: $userVerificationCode)
            }
            .frame(width: .infinity, height: 100)
            Button(
                action: {},
                label: {Text("Confirm")}
            )
            .frame(width: 100, height: 40, alignment: .center)
            .foregroundColor(Color("white"))
            .font(.body.bold())
            .background(Color("green"))
            .cornerRadius(10)
//
//
        Spacer()
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
        )
        .ignoresSafeArea()
        .background(Color("gray"))
    }
}

struct CharacterInputCell: View {
    @State var textValue: String
    
    var body: some View {
        VStack {
            TextField("",text: $textValue)
            Rectangle()
                 .frame(height: 3)
                 .foregroundColor(Color("green"))
        }
        .frame(height: 20)
        .frame(maxWidth: 20, alignment: .center)
        .padding([.trailing, .leading], 5)
        .padding([.vertical], 15)
        //.lineLimit(1)
        .multilineTextAlignment(.center)
    }
    
}

struct CustomTextField: UIViewRepresentable {

    class Coordinator: NSObject, UITextFieldDelegate {

        @Binding var text: String
        @Binding var currentlySelectedCell: Int

        var didBecomeFirstResponder = false

        init(text: Binding<String>, currentlySelectedCell: Binding<Int>) {
            _text = text
            _currentlySelectedCell = currentlySelectedCell
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
            }
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""

            guard let stringRange = Range(range, in: currentText) else { return false }

            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

            if updatedText.count <= 1 {
                self.currentlySelectedCell += 1
            }

            return updatedText.count <= 1
        }
    }

    @Binding var text: String
    @Binding var currentlySelectedCell: Int
    var isFirstResponder: Bool = false

    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        return textField
    }

    func makeCoordinator() -> CustomTextField.Coordinator {
        return Coordinator(text: $text, currentlySelectedCell: $currentlySelectedCell)
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}

struct Verification_Previews: PreviewProvider {
    static var previews: some View {
        Verification()
    }
}
