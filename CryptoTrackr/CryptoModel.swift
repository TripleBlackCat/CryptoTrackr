//
//  CryptoModel.swift
//  CryptoTrackr
//
//  Created by Kavilan Nair on 2017/07/11.
//  Copyright © 2017 Kavilan Nair. All rights reserved.
//

import Foundation
import Gloss


class CryptoModel: Glossy, Decodable{
    
    var id: String?
    var name: String?
    var symbol: String?
    var rank: String?
    var price_usd: String?
    var price_btc: String?
    var total_supply: String?
    
    
    
    required init?(json: JSON) {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.symbol = "symbol" <~~ json
        self.rank = "rank" <~~ json
        self.price_usd = "price_usd" <~~ json
        self.price_btc = "price_btc" <~~ json
        self.total_supply = "total_supply" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.id,
            "name" ~~> self.name,
            "symbol" ~~> self.symbol,
            "rank" ~~> self.rank,
            "price_usd" ~~> self.price_usd,
            "price_btc" ~~> self.price_btc,
            "total_supply" ~~> self.total_supply
            ])
    }
    
    
    
    
    

}
