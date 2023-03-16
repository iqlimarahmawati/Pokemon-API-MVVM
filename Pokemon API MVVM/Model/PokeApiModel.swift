//
//  PokeApiModel.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 15/03/23.
//

import Foundation

struct TypePokeModel: Codable {
    let  results : [Results]
}

struct Results: Codable {
    var name : String
    var url : String
}
