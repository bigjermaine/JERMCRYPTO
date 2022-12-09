//
//  HomeStateView.swift
//  JERMCRYPTO
//
//  Created by Apple on 21/10/2022.
//

import SwiftUI

struct HomeStateView: View {
    @EnvironmentObject private var homvm : HomeViewModel
    
    @Binding var showPortfolio:Bool
    var body: some View {
        HStack{
            ForEach( homvm .statistics) {
                stat in StatisticView(stat: stat)
                    .frame(width:UIScreen.main.bounds.width/3)
            }
            
        }
        .frame(width:UIScreen.main.bounds.width,alignment: showPortfolio ?  .trailing : .leading)
    }
}

struct HomeStateView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStateView(showPortfolio: .constant(false))
            .environmentObject(HomeViewModel())
    }
}
