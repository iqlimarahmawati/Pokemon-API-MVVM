//
//  MoveDetailPokemon.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 20/03/23.
//

import Foundation

struct PokemonMoveModel: Codable {
    let accuracy: Int?
    let power: Int?
    
enum CodingKeys: String, CodingKey {
        case accuracy
        case power
    }
}

