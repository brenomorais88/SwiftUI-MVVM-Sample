//
//  SwiftUISampleApp.swift
//  SwiftUISample
//
//  Created by Breno Morais on 08/09/23.
//

import SwiftUI

@main
struct LoginApp: App {
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
//            TextSamples()
            LoginView(viewModel: loginViewModel)
        }
    }
}
