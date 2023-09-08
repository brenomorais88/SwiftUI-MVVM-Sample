//
//  CustomTextField.swift
//  SwiftUISample
//
//  Created by Breno Morais on 08/09/23.
//

import SwiftUI

enum TextInputType {
    case normal
    case password
    case email
    case phone
}

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String?
    var inputType: TextInputType
    
    var body: some View {
        switch inputType {
        case .normal:
            return AnyView(
                TextField(placeholder ?? "", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            )
        case .password:
            return AnyView(
                SecureField(placeholder ?? "", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            )
        case .email:
            return AnyView(
                TextField(placeholder ?? "", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
            )
        case .phone:
            return AnyView(
                TextField(placeholder ?? "", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.phonePad)
                    .onChange(of: text) { newValue in
                        text = formatPhoneNumber(newValue)
                    }
            )
        }
    }
    
    private func formatPhoneNumber(_ phoneNumber: String) -> String {
        // Remove qualquer caractere não numérico do texto
        print(phoneNumber)
        let cleanedPhoneNumber = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        var formattedPhoneNumber = ""
        let mask = "(##) #####-####"
        var maskIndex = mask.startIndex
        var digitIndex = cleanedPhoneNumber.startIndex
        
        while maskIndex < mask.endIndex {
            if maskIndex == mask.endIndex {
                break
            }
            
            let maskChar = mask[maskIndex]
            
            if maskChar == "#" {
                if digitIndex < cleanedPhoneNumber.endIndex {
                    formattedPhoneNumber.append(cleanedPhoneNumber[digitIndex])
                    digitIndex = cleanedPhoneNumber.index(after: digitIndex)
                }
            } else {
                formattedPhoneNumber.append(maskChar)
            }
            
            maskIndex = mask.index(after: maskIndex)
        }
        
        return formattedPhoneNumber
    }
}


struct TextSamples: View {
    @State private var defaultText = ""
    @State private var passwordText = ""
    @State private var emailText = ""
    @State private var phoneText = ""

    var body: some View {
        VStack {
            CustomTextField(text: $defaultText, placeholder: "Campo de Texto Padrão", inputType: .normal)
            CustomTextField(text: $passwordText, placeholder: "Senha", inputType: .password)
            CustomTextField(text: $emailText, placeholder: "Email", inputType: .email)
            CustomTextField(text: $phoneText, placeholder: "Telefone", inputType: .phone)
        }
        .padding()
    }
}

