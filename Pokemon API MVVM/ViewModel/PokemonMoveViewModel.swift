//
//  PokemonMoveViewModel.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 20/03/23.
//

import Foundation

protocol PokemonMoveViewModelProtocol {
    var urlString: String {get}
    var bindMovePokemonData:((PokemonMoveModel?)->())? { get set}
    func fetchDataPokemon()
}

class PokemonMoveViewModel :PokemonMoveViewModelProtocol {
    var urlString: String = ""
    var bindMovePokemonData: ((PokemonMoveModel?) -> ())?
    var data: PokemonMoveModel?
    var apiService: GetPokemonApi?
    
    init(urlString: String, apiService: ApiServicePokemonProtocol) {
        self.urlString = urlString
        
        if let url = URL(string: urlString){
            self.apiService?.get(url: url)
            fetchDataPokemon()
        }
    }
    func fetchDataPokemon() {
        self.apiService?.callApi(model: PokemonMoveModel.self, completion: { response in
            switch response {
            case .success(let success):
                self.bindMovePokemonData?(success)
            case .failure(_):
                self.bindMovePokemonData?(nil)
            }
        })
    }
    
}
