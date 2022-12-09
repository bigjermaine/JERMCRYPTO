//
//  MarketDataServices.swift
//  JERMCRYPTO
//
//  Created by Apple on 21/10/2022.
//

import Foundation
import Combine

class marketdataservice {
    
    @Published var marketdata : MarketDataModel?  = nil
    
    
    var  globalsubcription:  AnyCancellable?
    
    
    init() {
        getMarketdta()
    }
    
    
    
    private func getMarketdta()  {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {return }

       let  globalsubcription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap {  (output) -> Data in
                     
                     guard let response = output.response as? HTTPURLResponse,
                           response.statusCode >= 200 &&  response.statusCode < 300 else {
                         throw URLError(.badServerResponse)
                     }
               
                return output.data
               
    
            }
            .receive(on: DispatchQueue.main)
            .decode(type:  GlobalData.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case.finished :
                    break
                    
                case.failure(let error):
                    
                    print(error.localizedDescription)
                }
                
            } receiveValue: { [weak self]  (returnedGlobaldata) in
                self?.marketdata  = returnedGlobaldata.data
                
                self?.globalsubcription?.cancel()
                
            }
         
        

    }
}
