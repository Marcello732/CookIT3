//
//  ContentView.swift
//  CookIT
//
//  Created by Macbook on 21/09/2022.
//

import SwiftUI

struct SingInUp: View {
    @State private var isIn:Bool = true
    @State private var isUp:Bool = false
    @State private var isLogIn:Bool = true
    @State private var isForgotPassword:Bool = true
    @State var userEmail: String = ""
    @State var userLogin: String = ""
    @State var userPassword: String = ""
    
    var body: some View {
        VStack (alignment: .center){
            Spacer()
            HStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .padding()
                    .frame(width: 200.0, height: 200.0)
                Spacer()
            }

            Spacer()
            
            Section {
                HStack {
                    Button(
                        action: {
                            isIn.toggle()
                            isUp.toggle()
                            isLogIn.toggle()
                            isForgotPassword.toggle()
                        },
                        label: {Text("Sing in")}
                    )
                    .frame(width: 140, height: 25, alignment: .center)
                    .background(isIn ? Color("green") : Color("gray").opacity(0.5))
                    .cornerRadius(10)
                    .id(isIn)
                    Button(
                        action: {
                            isIn.toggle()
                            isUp.toggle()
                            isLogIn.toggle()
                            isForgotPassword.toggle()
                        },
                        label: {Text("Sing up")}
                    )
                    .frame(width: 140, height: 25, alignment: .center)
                    .background(isUp ? Color("green") : Color("gray").opacity(0.5))
                    .cornerRadius(10)
                    .id(isUp)
                }
                
            }
            .frame(width: 300, height: 35)
            .font(.body.bold())
            .background(Color("gray"))
            .cornerRadius(10)
            .padding(5)
            .foregroundColor(Color("white"))
            
            Spacer()
            
            Section {
                if isIn{
                    VStack {
                        SuperTextField(
                            placeholder: "Login",
                            text: $userLogin
                        )
                        SuperSecureField(
                            placeholder: "Password",
                            text: $userPassword
                        )
                    }
                }else{
                    VStack {
                        SuperTextField(
                            placeholder: "Email",
                            text: $userEmail
                        )
                        SuperTextField(
                            placeholder: "Login",
                            text: $userLogin
                        )
                        SuperSecureField(
                            placeholder: "Password",
                            text: $userPassword
                        )
                    }
                }
            }
            .frame(width: 260, height: 40)
            Spacer()
            Button(
                action: {},
                label: {isLogIn ? Text("Log in") : Text("Register")}
            )
            .frame(width: 200, height: 40, alignment: .center)
            .foregroundColor(Color("white"))
            .font(.body.bold())
            .background(Color("green"))
            .cornerRadius(10)
            .id(isLogIn)
            
            Button(
                action: {},
                label: {isForgotPassword ? Text("Forgot password?") : Text("")}
            )
            .frame(width: 200, height: 30, alignment: .center)
            .foregroundColor(Color("green"))
            .font(.subheadline)
            .id(isForgotPassword)
            Spacer()
        }
        .background(Color("white"))
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
        )
        .ignoresSafeArea()
    }
}

struct SuperTextField: View {
    
    var placeholder: String
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        HStack {
            Text(placeholder)
                .foregroundColor(Color("green"))
                .padding(.leading, 16)
            TextField(placeholder, text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .tint(Color("green"))
                .foregroundColor(Color("green"))
                .keyboardType(.default)
        }
        Divider()
         .frame(height: 1)
         .padding(.horizontal, 30)
         .background(Color("gray"))
    }
}

struct SuperSecureField: View {
    
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(placeholder)
                .foregroundColor(Color("green"))
                .padding(.leading, 16)
            SecureField(placeholder, text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .tint(Color("green"))
                .foregroundColor(Color("green"))
                .keyboardType(.default)
        }
        Divider()
         .frame(height: 1)
         .padding(.horizontal, 30)
         .background(Color("gray"))
    }
}


struct SingInUp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
