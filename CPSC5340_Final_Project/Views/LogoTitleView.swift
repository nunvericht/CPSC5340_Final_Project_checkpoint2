//
//  LogoTitleView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/15/24.
//

import SwiftUI

struct LogoTitleView: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)

            Text("Welcome")
                .font(.custom("SF-Pro", size: 38))
                .lineLimit(2)

            Text("Apollo App")
                .font(.headline)

        }
        .foregroundColor(.white)
    }
}

#Preview {
    LogoTitleView()
}
