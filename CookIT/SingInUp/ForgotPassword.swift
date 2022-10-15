//
//  forgotPassword.swift
//  CookIT
//
//  Created by Macbook on 15/10/2022.
//

import SwiftUI

struct ForgotPassword: View {
    @State var userForgetPasswordEmail: String = ""
    
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            Text("Forgot password?")
                .font(.largeTitle.bold())
                .foregroundColor(Color("green"))
                .padding()
            Text("Enter the email address to which the link should be sent")
                .font(.body.bold())
                .foregroundColor(.black)
                .padding()
            SuperTextField(
                placeholder: "Email",
                text: $userForgetPasswordEmail
            )
                .padding(.leading, 20)
            
            Button(
                action: {
                    
                },
                label: {Text("Confirm")}
            )
            .frame(width: 100, height: 40, alignment: .center)
            .foregroundColor(Color("white"))
            .font(.body.bold())
            .background(Color("green"))
            .cornerRadius(10)
            
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

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
