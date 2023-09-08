//
//  PrimaryButton.swift
//  SwiftUISample
//
//  Created by Breno Morais on 08/09/23.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    let isEnabled: Bool
    let isLoading: Bool

    var body: some View {
        Button(action: {
            if !isLoading {
                action()
            }
        }) {
            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            } else {
                Text(title)
                    .font(.headline)
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .background(isEnabled ? Color.blue : Color.gray)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 20)
        .disabled(!isEnabled || isLoading)
    }
}
