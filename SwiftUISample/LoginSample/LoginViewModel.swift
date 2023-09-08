//
//  LoginViewModel.swift
//  SwiftUISample
//
//  Created by Breno Morais on 08/09/23.
//

import Foundation

enum LoginViewState: Equatable {
    case idle
    case loading
    case success
    case error(String) // Pode incluir uma mensagem de erro
}

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var phone: String = ""
    @Published var viewState: LoginViewState = .idle

    private let loginService = LoginService()

    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            return // Não faça login se o email ou senha estiverem vazios
        }
        
        self.viewState = .loading
        
        loginService.login(email: email, password: password) { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.viewState = .success
                case .failure(let error):
                    if error == .invalidCredentials {
                        self.viewState = .error("Credenciais inválidas")
                    } else {
                        // Trate outros erros de serviço aqui, se necessário
                        self.viewState = .error("Erro de rede")
                    }
                }
            }
        }
    }
}

