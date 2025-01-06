//
//  ContentView.swift
//  LoginUI
//
//  Created by apple on 1/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image(.mainBG)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.tint)
            VStack {
                Rectangle().background(.ultraThinMaterial)
                    .padding(.top,250)
                    .opacity(0.95)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 20,
                            bottomLeadingRadius: 20,
                            bottomTrailingRadius: 20,
                            topTrailingRadius: 20,
                            style: .continuous
                        )
                    )
            }
        }
        .background(Color.black.opacity(1.0))
        .padding()
    }
}

#Preview {
    ContentView()
}
