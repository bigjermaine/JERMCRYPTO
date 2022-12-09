
import Foundation
import SwiftUI

extension Double {
    /// convert a double into a currency with two -  six decimals place
    ///  convert  1234.86  to $1,234.86
    private var currencyformatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }
    
    func addcurrencywithdecimals2()  -> String  {
        let number = NSNumber(value: self)
        return currencyformatter2.string(from: number ) ?? "0.00"
    }
    /// convert 1.2345 to 1.23
    func asnumberstring2() -> String {
        return String(format: "%.2f", self)
    }
    func aspercenttring2() -> String {
        return String(format: "%.2f", self) + "%"
    }
    /// convert a double into a currency with two -  six decimals place
    ///  convert  1234.86  to $1,234.86
    private var currencyformatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 4
        return formatter
    }
    
    func addcurrencywithdecimals()  -> String  {
        let number = NSNumber(value: self)
        return currencyformatter6.string(from: number ) ?? "0.00"
    }
    /// convert 1.2345 to 1.23
    func asnumberstring() -> String {
        return String(format: "%.2f", self)
    }
    func aspercenttring() -> String {
        return String(format: "%.2f", self) + "%"
    }
    /// Convert a Double to a String with K, M, Bn, Tr abbreviations.
    /// ```
    /// Convert 12 to 12.00
    /// Convert 1234 to 1.23K
    /// Convert 123456 to 123.45K
    /// Convert 12345678 to 12.34M
    /// Convert 1234567890 to 1.23Bn
    /// Convert 123456789012 to 123.45Bn
    /// Convert 12345678901234 to 12.34Tr
    /// ```
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asnumberstring()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asnumberstring()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = asnumberstring()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = asnumberstring()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asnumberstring()
        default:
            return "\(sign)\(self)"
        }
    }

}



extension PreviewProvider {
    
    static var  dev:developerpreview {
        return developerpreview.instance
    }
    
}



class developerpreview  {
    static let instance = developerpreview()
    
    private init() {}
    let homvm = HomeViewModel()
    let stat1 = StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    let stat2 = StatisticModel(title: "Market Cap", value: "$12.5Bn")
    let stat3 = StatisticModel(title: "Portfolio Value", value: "$56.36k", percentageChange: -25.34)
    let coin =  CoinModel (
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 19299.55,
        marketCap:  370371934009,
        marketCapRank: 1 ,
        fullyDilutedValuation: 405448542370,
        totalVolume:  25299007752,
        high24H:  19669.88,
        low24H:     19092.9,
       priceChange24H:  -252.17766531294546,
      priceChangePercentage24H:  -1.2898,
       marketCapChange24H:  -4890837514.007141,
      marketCapChangePercentage24H:  -1.30331,
       circulatingSupply:  19183225,
       totalSupply:  21000000,
    maxSupply:  21000000,
      ath: 69045,
    athChangePercentage:  -72.06641,
        athDate: "2021-11-10T14:24:11.849Z",
      atl: 67.81,
        atlChangePercentage:  28342.66186,
     atlDate:  "2013-07-06T00:00:00.000Z",
        
       lastUpdated:  "2022-10-19T05:38:33.650Z",
        sparklineIn7D: CoinModel.SparklineIn7D(price : [
            19060.702787263657,
            19105.29072311209,
            19046.22520788986,
            19076.105092736812,
            19125.671773240694,
            19144.654323896044,
            19147.91831047318,
            19187.53482170786,
            19169.4668694631,
            19152.894115946925,
            19142.083282468786,
            19104.06923230991,
            19069.122556127437,
            19091.685527894424,
            19088.43394166963,
            19102.07282164791,
            19052.79146011756,
            19000.771852818132,
            19013.98771232447,
            18971.82673690142,
            18668.43800740156,
            18738.263946389867,
            18372.467618415467,
            18446.249615209843,
            18549.44265006655,
            18956.623314261615,
            19134.293272681512,
            19162.663441529963,
            19345.901532300853,
            19375.0203223811,
            19397.389414660393,
            19417.047285905723,
            19416.431533390813,
            19387.465655359778,
            19427.734142614256,
            19872.748771742114,
            19805.44241393039,
            19823.376419821096,
            19813.481685955197,
            19821.016580012627,
            19806.69659633123,
            19647.43647008476,
            19608.08701544435,
            19636.059682552885,
            19673.63445597292,
            19626.356692909318,
            19781.891386388746,
            19637.695106066705,
            19458.010823013457,
            19371.36102851284,
            19312.78233347125,
            19353.72195104118,
            19198.915511839783,
            19223.57423056235,
            19185.19560060955,
    ]),
        priceChangePercentage24HInCurrency: -1.2897972187238973, currentHoldings:122999)
}

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
