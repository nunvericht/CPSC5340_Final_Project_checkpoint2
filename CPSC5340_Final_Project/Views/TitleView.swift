//
//  TitleView.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/19/24.
//

import SwiftUI


struct TitleView: View {
    
    var imageUrl = URL(string: "https://cdn2.thedogapi.com/images/quiHq2FiB.jpg")
    var name = "Pet Rescue"
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                
            }
        placeholder: {
            ProgressView()
            
        }
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                    .foregroundColor(.black)
                Text("online")
                    .font (.caption)
                    .foregroundColor(.green)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "phone.fill")
                .padding(10)
                .background(.gray)
                .foregroundColor(.black)
                .cornerRadius(50)
            }
        .padding()
        }
    }

#Preview {
    TitleView()
        .background(Color("Tan"))
}
