//
//  PortfolioDataService.swift
//  JERMCRYPTO
//
//  Created by Apple on 22/10/2022.
//

import Foundation
import CoreData


class PortfolioDataService {
    
    private let containers:NSPersistentContainer
    private let containerName:String =  "PortflioContainer"
    private let entityName:String = "PorfolioEntity"
    @Published var savedEntities: [PorfolioEntity] = []
    
    init() {
        containers = NSPersistentContainer(name: containerName)
        containers.loadPersistentStores {(_, error) in
            
            if let error = error {
                print("Error loading core data! \(error)")
            }
        }
    }
    
    func updatePorfoilio(coin:CoinModel , amount:Double)  {
        if let entity  = savedEntities.first(where: {$0.coinID == coin.id}){
            if amount > 0 {
                update(entity: entity, amount: amount)
            }else {
                remove(entity: entity)
            }
            }else{
                add(coin: coin, amount: amount)
            }
        
    }
    private func getPortfolio()
    {
        let request = NSFetchRequest<PorfolioEntity>(entityName: entityName)
        
        do{
            savedEntities = try containers.viewContext.fetch(request)
        } catch let error {
            print("Error fetching portfolio Entities. \(error)")
        }
    }
    
     
    func add (coin:CoinModel, amount:Double) {
        let entity = PorfolioEntity(context: containers.viewContext)
        
        entity.coinID = coin.id
        entity.amount = amount
        applychanges()
    }
    
    func update(entity:PorfolioEntity , amount:Double){
        entity.amount = amount
        applychanges()
    }
    
    func remove(entity:PorfolioEntity) {
        containers.viewContext.delete(entity)
        applychanges()
    }
    
    func save() {
        do{
            try containers.viewContext.save()
        } catch let error {
            print(" Error saving to core data. \(error)")
        }
    }
    
    func applychanges() {
        save()
        getPortfolio()
    }
}

