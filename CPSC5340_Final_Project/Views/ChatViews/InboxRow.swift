//
//  InboxRow.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/20/24.
//

import SwiftUI

struct InboxItem: View {
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: "dog.circle.fill")
            .resizable()
            .frame(width: 64, height: 64)
            VStack(alignment: .leading) {
                Text("Dog Rescuer")

                Text("Looking for a dog that is good with kids")
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            HStack {
                Text("Yesterday")
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.gray)
        }
        .frame(height: 75)
    }
}

#Preview {
    InboxItem()
}
