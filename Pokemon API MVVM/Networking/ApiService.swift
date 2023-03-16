//
//  ApiService.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 15/03/23.
//

import Foundation

protocol ApiServicePokemonProtocol {
    var url: String { get }
    func callApi(completion: @escaping(TypePokeModel?)-> Void)
}

struct GetPokemonApi : ApiServicePokemonProtocol  {
    var url: String
    
    init(url: String){
        self.url = url
    }
    
    func callApi(completion: @escaping(TypePokeModel?)->Void) {
        guard let url = URL(string: self.url) else {return}
        
        URLSession.shared.dataTask (with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder ()
                    let modelData = try decoder.decode(TypePokeModel.self, from: data)
                    completion(modelData)
                } catch {
                    completion(nil)
                }
            }
        }.resume()
        
    }
    
}
