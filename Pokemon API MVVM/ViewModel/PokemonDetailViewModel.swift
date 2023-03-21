//
//  PokemonDetailViewModel.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 17/03/23.
//

import Foundation

protocol PokemonDetailViewModelProtocol {
    var urlString : String {get}
    var bindDetailPokemonData : ((PokemonDetailModel?)->())? {get set}
    func fetchDataPokemon()
}

class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    
    private var apiService: ApiServicePokemonProtocol?
    var urlString: String
    var bindDetailPokemonData: ((PokemonDetailModel?) -> ())?
    var data: PokemonDetailModel?
    
    
    init(urlString : String, apiService: ApiServicePokemonProtocol) {
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL(string: urlString) {
            self.apiService?.get(url: url)
        }
        
        fetchDataPokemon()
    }
    //        self.apiService?.callApi(completion: {response in
    //            if let dataResponse = response {
    //                self.data = dataResponse
    //                self.bindDetailPokemonData?(dataResponse)
    //            }else {
    //                self.bindDetailPokemonData?(nil)
    //            }
    //        })
    //    }
    //    }
    func fetchDataPokemon() {
        self.apiService?.callApi(model: PokemonDetailModel.self, completion: { response in
            switch response {
            case .success(let success):
                self.data = success
                let group = DispatchGroup()
                
                for (index, move) in success.moves.enumerated(){
                    group.enter()
                    
                    guard let url = URL(string: move.move.url) else {
                        group.leave()
                        continue
                    }
                    
                    self.apiService?.get(url: url)
                    self.apiService?.callApi(model: PokemonMoveModel.self, completion: { response in
                        switch response {
                        case .success(let moveDetail):
                            self.data?.moves[index].move.moveDetail = moveDetail
                        case .failure(_):
                            self.bindDetailPokemonData?(nil)
                        }
                        group.leave()
                    })
                }
                
                group.notify(queue: DispatchQueue.main) {
                    self.bindDetailPokemonData?(self.data)
                }
        
            case .failure(_):
                self.bindDetailPokemonData?(nil)
            }
        })
    }
}
