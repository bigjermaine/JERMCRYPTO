//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Apple on 19/10/2022.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics : [StatisticModel] =  []
    @Published var allcoins: [CoinModel] = []
    @Published var portfoliocoins:  [CoinModel] = []
    private let  Marketdataservice = marketdataservice()
    private let dataService = CoinDataservice()
    private var  cancellables =  Set<AnyCancellable>()
    @Published var searchtext: String = ""
    @Published var globaldata : [GlobalData]  = []
    private  let portfolioservices = PortfolioDataService()
  
          
    init(){
        addsubcribers()
        }
    
    func  addsubcribers() {
        dataService.$allcoins
            .sink { [weak self]  (returnedCoins) in
                self?.allcoins  = returnedCoins
                
             
                
            }
            .store(in: &cancellables)
        
        $searchtext
            .combineLatest(dataService.$allcoins)
            .map { (text, startingcoin) -> [CoinModel]  in
                guard !text.isEmpty else {
                    return startingcoin
                }
                
             let  lowercasedText = text.lowercased()
                return startingcoin.filter { (coin) -> Bool in
                    return     coin.name.lowercased().contains(lowercasedText) ||
                    coin.symbol.lowercased().contains(lowercasedText) ||
                     coin.id.lowercased().contains(lowercasedText)
            }
                
        }
            .sink { [weak self]  (returnedCoins) in
                self?.allcoins  = returnedCoins
                
    }
        
            .store(in: &cancellables)
        
        
        // update portfolio
        
        $allcoins
            .combineLatest(portfolioservices.$savedEntities)
            .map { (coinModel, portfolioEntities) -> [CoinModel]  in
                
                coinModel
                    .compactMap { (coin) -> CoinModel? in
                        
                        guard let entity = portfolioEntities.first(where: {$0.coinID == coin.id}) else {
                            return nil
                        }
                        
                        return coin.updateholdings(amount: entity.amount)
                    }
                
                    
            }
            .sink { [weak self]  (returnedCoins) in
                self?.portfoliocoins  = returnedCoins
            }
        
            .store(in: &cancellables)
        
        
        Marketdataservice.$marketdata
            .map { (globaldatamodel) -> [StatisticModel]  in
                
                var state: [StatisticModel] = []
                
                
                guard let data = globaldatamodel else {
                    return state
                }
                let marketcap = StatisticModel(title: "market cap", value: data.marketcap, percentageChange: data.marketCapChangePercentage24HUsd)
                state.append( marketcap)
                
                let volume = StatisticModel(title: "24HrVolume", value: data.volume)
                state.append(volume)
                
                let dominance = StatisticModel(title: "BTC Dominance", value: data.Totaldominance)
                state.append(dominance)
                
                let portfolio = StatisticModel(title: "portfolio value", value: "$0.00")
                state.append(portfolio)
                
                
                return state
                }
            .sink { [weak self]  (returnedstats) in
                self?.statistics = returnedstats
                
            }
            .store(in: &cancellables)
        
      
    }
    func updatePorfoilio(coin:CoinModel , amount:Double) {
        portfolioservices.updatePorfoilio(coin:coin, amount: amount)
    }
}
