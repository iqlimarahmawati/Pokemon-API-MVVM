//
//  PokemonDetail.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 17/03/23.
//

import Foundation

struct PokemonDetailModel: Codable{
    let id:Int
    let name: String
    let moves: [MoveElement]
    let sprites: Sprites
    let stats: [Stat]
}
 struct MoveElement: Codable {
    let move: StatClass
}
 struct StatClass: Codable {
     let name: String
     let url: String
 }
struct Sprites: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct Stat: Codable {
    let baseStat: Int
    let stat: StatClass

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}

