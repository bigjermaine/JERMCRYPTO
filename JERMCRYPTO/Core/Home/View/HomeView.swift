//
//  HomeView.swift
//  CryptoApp
//
//  Created by Apple on 18/10/2022.
//

import SwiftUI
import Foundation
struct HomeView: View {
    @StateObject var  homeViewModel = HomeViewModel()
    @State var showPortfolio: Bool = false
    @State var showPortfolioView: Bool = false
    
    var body: some View {
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                homeheader
                HomeStateView( showPortfolio:$showPortfolio)
                SearchBarView(searchtext: $homeViewModel.searchtext)
                    
                    if !showPortfolio {
                        HStack{
                    Text("coin")
                       
                            Spacer()
                        Text("price")
                           
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    }else{
                        HStack{
                        Text("coin")
                            .padding(.leading ,8)

                    Spacer()
                        
                    Text("holdings")
                    Text("price")
                        .frame(width:UIScreen.main.bounds.width/3.0)
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                    
                        }
               
               
                    
                
                if !showPortfolio {
                allcoins
                        .transition(.move(edge: .leading))
                
                
                }else{
                    portfoliocoins
                        .transition(.move(edge: .leading))
                }
            }
          
  
    }
        .sheet(isPresented: $showPortfolioView) {
            PortfolioView()
                .environmentObject(homeViewModel)
        }
  }
    
}
    


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        HomeView()
             
                .environmentObject(HomeViewModel())
                .navigationBarHidden(true)
                
            
        }
      
        
    }
}

//MARK: homeview

extension HomeView  {
    private var homeheader: some View {
        
       
            HStack{
                
                Button {
                    if showPortfolio {
                    showPortfolioView.toggle()
                    }
                }label:{
                CircleButton(iconname: showPortfolio ? "plus"  : "info" )
                    .animation(.none)
                    .background(
                        CirclebuttonAnimatingView(animate: $showPortfolio))
                }
                Spacer()
                Text(showPortfolio ? "Portfolio" : "Live Prices")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Spacer()
                CircleButton(iconname: "chevron.right")
                    .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                    .onTapGesture {
                        withAnimation(.spring()){
                            showPortfolio.toggle()
                        }
                    }
            }
            .padding(.horizontal)
           
        }
    
    ///  allcoins
    private var   allcoins : some View {
    List {
        ForEach(homeViewModel.allcoins) {
            coin in
            CoinRowView(coin: coin, showholdingcolumn: false)
                .environmentObject(HomeViewModel())
        }
    }
    .listStyle(PlainListStyle())
   
      
    }
    ///portfoliocoins
    private var   portfoliocoins : some View {
    List {
        ForEach(homeViewModel.portfoliocoins) {
            coin in
            CoinRowView(coin: coin, showholdingcolumn: true).environmentObject(HomeViewModel())
        }
    } .listStyle(PlainListStyle())
      
    }
 

}
