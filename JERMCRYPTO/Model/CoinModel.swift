//
//  CoinModel.swift
//  CryptoApp
//
//  Created by Apple on 19/10/2022.
//

// Coingecko api info

// URL:https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h


// jsonreponse:
//// {
//    "id": "bitcoin",
//    "symbol": "btc",
//    "name": "Bitcoin",
//    "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
//    "current_price": 19299.55,
//    "market_cap": 370371934009,
//    "market_cap_rank": 1,
//    "fully_diluted_valuation": 405448542370,
//    "total_volume": 25299007752,
//    "high_24h": 19669.88,
//    "low_24h": 19092.9,
//    "price_change_24h": -252.17766531294546,
//    "price_change_percentage_24h": -1.2898,
//    "market_cap_change_24h": -4890837514.007141,
//    "market_cap_change_percentage_24h": -1.30331,
//    "circulating_supply": 19183225,
//    "total_supply": 21000000,
//    "max_supply": 21000000,
//    "ath": 69045,
//    "ath_change_percentage": -72.06641,
//    "ath_date": "2021-11-10T14:24:11.849Z",
//    "atl": 67.81,
//    "atl_change_percentage": 28342.66186,
//    "atl_date": "2013-07-06T00:00:00.000Z",
//    "roi": null,
//    "last_updated": "2022-10-19T05:38:33.650Z",
//    "sparkline_in_7d": {
//      "price": [
//        19060.702787263657,
//        19105.29072311209,
//        19046.22520788986,
//        19076.105092736812,
//        19125.671773240694,
//        19144.654323896044,
//        19147.91831047318,
//        19187.53482170786,
//        19169.4668694631,
//        19152.894115946925,
//        19142.083282468786,
//        19104.06923230991,
//        19069.122556127437,
//        19091.685527894424,
//        19088.43394166963,
//        19102.07282164791,
//        19052.79146011756,
//        19000.771852818132,
//        19013.98771232447,
//        18971.82673690142,
//        18668.43800740156,
//        18738.263946389867,
//        18372.467618415467,
//        18446.249615209843,
//        18549.44265006655,
//        18956.623314261615,
//        19134.293272681512,
//        19162.663441529963,
//        19345.901532300853,
//        19375.0203223811,
//        19397.389414660393,
//        19417.047285905723,
//        19416.431533390813,
//        19387.465655359778,
//        19427.734142614256,
//        19872.748771742114,
//        19805.44241393039,
//        19823.376419821096,
//        19813.481685955197,
//        19821.016580012627,
//        19806.69659633123,
//        19647.43647008476,
//        19608.08701544435,
//        19636.059682552885,
//        19673.63445597292,
//        19626.356692909318,
//        19781.891386388746,
//        19637.695106066705,
//        19458.010823013457,
//        19371.36102851284,
//        19312.78233347125,
//        19353.72195104118,
//        19198.915511839783,
//        19223.57423056235,
//        19185.19560060955,
//]
//  },
//  "price_change_percentage_24h_in_currency": -1.2897972187238973
//},
import Foundation
import SwiftUI


struct CoinModel : Identifiable,Codable  {
    
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
          case id, symbol, name, image
          case currentPrice = "current_price"
          case marketCap = "market_cap"
          case marketCapRank = "market_cap_rank"
          case fullyDilutedValuation = "fully_diluted_valuation"
          case totalVolume = "total_volume"
          case high24H = "high_24h"
          case low24H = "low_24h"
          case priceChange24H = "price_change_24h"
          case priceChangePercentage24H = "price_change_percentage_24h"
          case marketCapChange24H = "market_cap_change_24h"
          case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
          case circulatingSupply = "circulating_supply"
          case totalSupply = "total_supply"
          case maxSupply = "max_supply"
          case ath
          case athChangePercentage = "ath_change_percentage"
          case athDate = "ath_date"
          case atl
          case atlChangePercentage = "atl_change_percentage"
          case atlDate = "atl_date"
          case lastUpdated = "last_updated"
          case sparklineIn7D = "sparkline_in_7d"
          case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
          case currentHoldings
        
        
      }
    
    func updateholdings(amount: Double) ->   CoinModel {
        return  CoinModel(id:id, symbol:  symbol, name:  name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath:  ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
   
    // MARK: - currentHoldings
   var currentHoldinsvalue: Double {
        return(currentHoldings ?? 0 ) * currentPrice
    }
    
    var rank: Int {
        return  Int(marketCapRank ?? 0 )
    }

    // MARK: - SparklineIn7D
     struct SparklineIn7D:Codable  {
        let price: [Double]?
     }


   
}
