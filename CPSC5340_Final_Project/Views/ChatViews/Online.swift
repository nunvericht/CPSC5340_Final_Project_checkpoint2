//
//  Online.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/20/24.
//

import SwiftUI

struct Online: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32) {
                ForEach(0...10, id: \.self) { user in
                    VStack {
                    ZStack(alignment: .bottomTrailing) {
                            Image(systemName: "dog.circle.fill")
                                .resizable()
                                .frame(width: 64, height: 64)
                                .foregroundStyle(.blue, Color(.systemGray4))
                                Circle()
                                    .fill(.green)
                                    .frame(width: 14, height: 14)
                        }
                        Text("Pet Rescue")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
        .frame(height: 110)
    }
}

#Preview {
    Online()
}
