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
    var moves: [MoveElement]
    let sprites: Sprites
    let stats: [Stat]
//    let accuracy: Int?
//    let power: Int?
}
 struct MoveElement: Codable {
    var move: StatClass
}
 struct StatClass: Codable {
     let name: String
     let url: String
     var moveDetail: PokemonMoveModel?
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

