//
//  CoinLogoView.swift
//  JERMCRYPTO
//
//  Created by Apple on 21/10/2022.
//

import SwiftUI

struct CoinLogoView: View {
    let coin :CoinModel
    var body: some View {
        VStack{
        AsyncImage(url:URL(string: coin.image)){ image in image.resizable().aspectRatio(contentMode: .fill)
        .frame(width: 50, height: 50)
        .cornerRadius(20)
            
        }placeholder: {
            Rectangle()
                .foregroundColor(.gray.opacity(0.3))
                .frame(width: 50, height:50)
                .cornerRadius(20)
        }
            Text(coin.symbol.uppercased())
                .font(.headline)
                .lineLimit(1)
            Text(coin.name)
                .font(.caption)
                .lineLimit(1)
                .foregroundColor(.secondary)
        }
    }
}

struct CoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        CoinLogoView(coin: dev.coin)
    }
}
