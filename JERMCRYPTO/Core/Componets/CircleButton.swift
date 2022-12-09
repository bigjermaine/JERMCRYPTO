//
//  CircleButton.swift
//  CryptoApp
//
//  Created by Apple on 18/10/2022.
//

import SwiftUI

struct CircleButton: View {
    
    let iconname:String
    
    var body: some View {
       Image(systemName: iconname)
            .font(.headline)
            .foregroundColor(Color.black)
            .frame(width: 50, height: 50)
            .background(
              Circle()
                .foregroundColor(.blue)
            )
            .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 0 )
            .padding()
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
        CircleButton(iconname:"arrow.up")
                .previewLayout(.sizeThatFits)
            CircleButton(iconname:"arrow.up")
                    .previewLayout(.sizeThatFits)
                    .preferredColorScheme(.dark)
            
        }
    }
}
