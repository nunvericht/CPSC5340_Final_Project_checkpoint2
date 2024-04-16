//
//  LogoView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/15/24.
//

import SwiftUI

struct LogoView: View {

    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(1/1, contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    LogoView(imageName: "")
}
