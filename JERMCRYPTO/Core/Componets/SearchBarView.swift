//
//  SearchBarView.swift
//  JERMCRYPTO
//
//  Created by Apple on 20/10/2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchtext: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchtext.isEmpty ?
                    Color.blue:Color.black
                )
            
            TextField("search by name or symbol", text: $searchtext)
                .foregroundColor(Color.black)
                .disableAutocorrection(true)
                .overlay(
                Image(systemName: "xmark.circle.fill")
                    .padding()
                    .offset(x: 10)
                    .foregroundColor(.black)
                    .opacity(searchtext.isEmpty ? 0.0 : 1.0)
                    .onTapGesture {
                        
                        UIApplication.shared.endEditing()
                        searchtext = ""
                    }
                ,alignment: .trailing
                
                )
        }
        .font(.headline)
        
        .padding()
        .background(
            
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
                .shadow(radius: 10)
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchtext: .constant(""))
    }
}
