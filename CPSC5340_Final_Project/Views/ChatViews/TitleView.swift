//
//  TitleView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/19/24.
//

import SwiftUI


struct TitleView: View {
    
    var imageUrl = URL(string: "https://cdn2.thedogapi.com/images/quiHq2FiB.jpg")
    var name = "Pet Rescue Chat"
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: imageUrl) { image in
                    image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                } 
                placeholder: {
                    Image(systemName: "dog.circle.fill")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .foregroundStyle(.blue, Color(.systemGray4))
                }
                .frame(width: 64, height: 64)
                Circle()
                    .fill(.green)
                    .frame(width: 14, height: 14)
            }
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                    .foregroundStyle(Color(.black))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "text.bubble.fill")
                .padding(10)
                .background(.gray)
                .foregroundStyle(Color(.black))
                .cornerRadius(50)
        }
        .padding()
    }
}

#Preview {
    TitleView()
        .background(Color("Tan"))
}
