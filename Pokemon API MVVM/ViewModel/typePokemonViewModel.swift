//
//  typePokemonViewModel.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 15/03/23.
//

import Foundation

protocol TypePokemonViewModelProtocol {
    var urlString : String { get }
    var bindTypePokemonData : ((TypePokeModel?)->())? {get set}
    func fetchDataPokemon()
}

class TypePokemonViewModel: TypePokemonViewModelProtocol {
    
    private var apiService : ApiServicePokemonProtocol?
    var urlString: String
    var data : TypePokeModel?
    
    var bindTypePokemonData: ((TypePokeModel?) -> ())?

    
    init(urlString : String, apiService: ApiServicePokemonProtocol) {
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL(string: urlString) {
            self.apiService?.get(url: url)
        }
        
        fetchDataPokemon()
    }
    
//        func fetchDataPokemon() {
//            self.apiService?.callApi(model: TypePokeModel, completion: {response in
//                if let dataResponse = response {
//                    self.data = dataResponse
//                    self.bindTypePokemonData?(dataResponse)
//                }else {
//                    self.bindTypePokemonData?(nil)
//                }
//            })
            func fetchDataPokemon() {
            self.apiService?.callApi(model: TypePokeModel.self, completion: { response in
                switch response {
                case .success(let success):
                    self.bindTypePokemonData?(success)
                case .failure(_):
                    self.bindTypePokemonData?(nil)
                }
            })
        }
    
    
    
    
    
    
    

    
//    private var apiService : ApiServicePokemonProtocol?
//    var urlString: String = ""
//    var data: [TypePokeModel]?
//    var bindTypePokemonData: (([TypePokeModel]?) -> Void)?
//
//
//
//init(urlString: String, apiService: ApiServicePokemonProtocol) {
//    self.urlString = urlString
//    self.apiService = apiService
//    if let url = URL(string: urlString) {
//        self.apiService?.get(url:url)
//    }
//    func fetchDataPokemon(){
//        self.apiService?.loadPokemon(model:TypePokeModel.self, completion { response in
//            switch response {
//            case .success(let success) {
//                self.bindTypePokemonData?(success)
//            case .failure (_)
//                self.bindTypePokemonData?(nil)
//            }
//            }
//
//        } )
//    }
}
