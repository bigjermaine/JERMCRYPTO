//
//  PortfolioView.swift
//  JERMCRYPTO
//
//  Created by Apple on 21/10/2022.
//

import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject private var homeViewModel : HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @Environment(\.presentationMode) var presentationmode
    @State  var quantity: String = ""
    @State  var Showcheckmark:Bool =  false
    var body: some View {
        NavigationView{
            
            VStack(alignment: .leading){
                SearchBarView(searchtext: $homeViewModel.searchtext)
                ScrollView(.horizontal,showsIndicators: false){
                    HStack( spacing: 8){
                        ForEach(homeViewModel.searchtext.isEmpty  ? homeViewModel.portfoliocoins : homeViewModel.allcoins) {
                            coin in
                            CoinLogoView(coin: coin)
                                .frame(width:70)
                                .padding(4)
                                .onTapGesture {
                                    selectedCoin = coin
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(selectedCoin?.id == coin.id ? LinearGradient(colors: [.black,.green,.red], startPoint: .topLeading, endPoint: .topTrailing) : LinearGradient(colors: [.white,.white,.white], startPoint: .topLeading, endPoint: .topTrailing) ,lineWidth: 1)
                                )
                            
                            
                                .environmentObject(HomeViewModel())
                        }
                        
                    }
                    
                    
                }
                
                
                if selectedCoin != nil {
                    VStack(spacing: 20) {
                        HStack{
                            Text("Current price of \(selectedCoin?.symbol.uppercased() ?? "")")
                            Spacer()
                            Text(selectedCoin?.currentPrice.addcurrencywithdecimals2() ?? "")
                        }
                        Divider()
                        HStack{
                            Text("Amount in your portfolio")
                                .lineLimit(1)
                            Spacer()
                            TextField("Ex: 1.4", text: $quantity)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                        }
                        HStack{
                            Text("CurrentHoldings")
                            Spacer()
                            Text(getcurrentvalue().asnumberstring2())
                            
                        }
                    }
                    .padding()
                }
                
            }
            
            .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .topLeading)
            .navigationBarTitle("Edit Portfolio")
            .navigationBarItems(leading:
                                    Button{
                presentationmode.wrappedValue.dismiss()
            }label:{
                Image(systemName: "xmark")
                    .font(.headline)
            },
                                trailing:
                                    
                                    HStack{
                
                Image(systemName: "checkmark")
                    .opacity(Showcheckmark ? 1.0: 0.0)
                
                Button {
                    selectedbutton()
                }label:{
                    Text( "save".uppercased())
                        .font(.headline)
                        .opacity((selectedCoin != nil) ? 1.0: 0)
                }
            }
            )}
        .onChange(of: homeViewModel.searchtext) { V in
            if V == "" {
                Removedbutton()
            }
        }
        
    }
    private func getcurrentvalue() -> Double {
        if let quantitys = Double(quantity){
            return quantitys * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
        
        func selectedbutton() {
    
            guard   let coin = selectedCoin  else { return   }
            guard let  amount = Double(quantity) else { return   }
         
            
            homeViewModel.updatePorfoilio(coin:coin , amount:  amount)
            withAnimation(.easeIn){
                Showcheckmark = true
                Removedbutton()
            }
            // hide keyboard
            UIApplication.shared.endEditing()
            
            // hide checkmark
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                
                withAnimation(.easeOut) {
                    Showcheckmark = false
                }
            }
        
        
    }
    func Removedbutton() {
        selectedCoin = nil
        homeViewModel.searchtext = ""
    }
    func updateCoin(coin: CoinModel){
        selectedCoin = coin
        
        if let portfliocoin = homeViewModel.portfoliocoins.first(where: { $0.id == coin.id
        }),
           let amount = portfliocoin.currentHoldings {
            quantity = "\(amount)"
        }else {
            quantity = ""
        }
            
        }
   
}
struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView().environmentObject(HomeViewModel())
        
    }
    
    
}
