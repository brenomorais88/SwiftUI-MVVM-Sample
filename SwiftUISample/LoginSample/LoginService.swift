//
//  LoginService.swift
//  SwiftUISample
//
//  Created by Breno Morais on 08/09/23.
//

import Foundation

enum LoginServiceError: Error {
    case invalidCredentials
    case networkError
}

class LoginService {
    func login(email: String, password: String, completion: @escaping (Result<Void, LoginServiceError>) -> Void) {
        // Simulando uma chamada de serviço
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            // Suponha que a chamada ao serviço tenha sido bem-sucedida
            let success = true
            if success {
                completion(.success(()))
            } else {
                completion(.failure(.invalidCredentials))
            }
        }
    }
}
