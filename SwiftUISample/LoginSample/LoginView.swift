//
//  LoginView.swift
//  SwiftUISample
//
//  Created by Breno Morais on 08/09/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            CustomTextField(text: $viewModel.phone, placeholder: "Telefone(opcional)", inputType: .phone)
            CustomTextField(text: $viewModel.email, placeholder: "Email", inputType: .email)
            CustomTextField(text: $viewModel.password, placeholder: "Senha", inputType: .password)
            
            PrimaryButton(title: "Login",
                          action: viewModel.login,
                          isEnabled: isLoginButtonEnabled,
                          isLoading: viewModel.viewState == .loading)
            
            if viewModel.viewState == .success {
                Text("Login bem-sucedido!")
                    .foregroundColor(.green)
            }
            
            if case .error(let errorMessage) = viewModel.viewState {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
    
    var isLoginButtonEnabled: Bool {
        return !viewModel.email.isEmpty && !viewModel.password.isEmpty
    }
}
