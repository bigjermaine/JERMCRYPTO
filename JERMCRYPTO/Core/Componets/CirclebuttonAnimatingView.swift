//
//  CirclebuttonAnimatingView.swift
//  CryptoApp
//
//  Created by Apple on 18/10/2022.
//

import SwiftUI

struct CirclebuttonAnimatingView: View {
    
    @Binding var animate:Bool
    var body: some View {
      
       Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeInOut(duration: 1.0) :  .none)
            
        
    }
}

struct CirclebuttonAnimatingView_Previews: PreviewProvider {
    static var previews: some View {
        CirclebuttonAnimatingView(animate: . constant(false))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}
