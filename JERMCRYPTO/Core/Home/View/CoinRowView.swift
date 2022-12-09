//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Apple on 19/10/2022.
//

import SwiftUI
import Foundation
struct CoinRowView: View {
    let coin :CoinModel
    
   let showholdingcolumn:Bool
    @EnvironmentObject private var homvm : HomeViewModel
    
    var body: some View {
        HStack(spacing:0){
           leftcolumn
        
            Spacer()
            if showholdingcolumn {
                middlecolumn
            }
            
            lastcolumn
        }
      }
    }


struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            CoinRowView(coin: dev.coin,showholdingcolumn: true).previewLayout(.sizeThatFits)
            CoinRowView(coin: dev.coin,showholdingcolumn: true)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            
        }
        .environmentObject(HomeViewModel())
    }
}


extension CoinRowView {
    
    
    private var leftcolumn: some View {
        HStack(spacing:0){
        Text("\(coin.rank)")
            .font(.caption)
            .frame(minWidth: 30)
        
            AsyncImage(url:URL(string: coin.image)){ image in image.resizable().aspectRatio(contentMode: .fill)
            .frame(width: 20, height: 20)
            .cornerRadius(20)
            }placeholder: {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(width: 20, height:20)
                    .cornerRadius(20)
            }
        
        Text((coin.symbol).uppercased())
            .font(.headline)
            .padding(.leading, 6)
        }
    }
    
    private var middlecolumn: some View {
    VStack(alignment:.leading,spacing: 1){
        Text(coin.currentHoldinsvalue.addcurrencywithdecimals2())
        
        Text(coin.currentHoldings?.addcurrencywithdecimals2() ?? "0" )
     }
    }
    
    private var lastcolumn: some View {
    VStack(alignment:.trailing){
        Text(coin.currentPrice.addcurrencywithdecimals2())
            .bold()
        Text(coin.priceChangePercentage24H?.aspercenttring() ?? "")
            .foregroundColor(
                (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.green : Color.red
            )
    }
    .frame(width:UIScreen.main.bounds.width/3.0,alignment: .trailing)
        
    }
}
