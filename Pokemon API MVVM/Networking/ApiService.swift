//
//  ApiService.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 15/03/23.
//

import Foundation


// jadi pakai generic type
protocol ApiServicePokemonProtocol {
    
    mutating func get(url: URL)
    
    func callApi<T:Codable>(model: T.Type, completion:@escaping (Result<T, Error>) -> Void)
}

struct GetPokemonApi: ApiServicePokemonProtocol {
    
    private var url = URL(string: "")
   
    mutating func get(url: URL) {
            self.url = url
    }
    
    func callApi<T>(model: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        
        guard let url = self.url else { return }
        
        URLSession.shared.dataTask(with: url) { data,response, error in
            if let data = data {
                do {
                    let modelData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(modelData))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
//    func callApiDetail(completion: @escaping(PokemonDetailModel?)-> Void) {
//           guard let url = URL(string: self.url) else {return}
//           URLSession.shared.dataTask(with: url) { data, response, error in
//               if let data = data {
//                   do {
//                       let decoder = JSONDecoder ()
//                       let modelData = try decoder.decode(PokemonDetailModel.self, from: data)
//                       completion(modelData)
//                   } catch {
//                       completion(nil)
//
//                   }
//               }
//           }
//       }
   
   
   }
    





//protocol ApiServicePokemonProtocol {
//    var url: String { get }
//    func callApi(completion: @escaping(TypePokeModel?)-> Void)
//}
//
//struct GetPokemonApi : ApiServicePokemonProtocol  {
//    var url: String
//
//    init(url: String){
//        self.url = url
//    }
//
//    func callApi(completion: @escaping(TypePokeModel?)->Void) {
//        guard let url = URL(string: self.url) else {return}
//
//        URLSession.shared.dataTask (with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder ()
//                    let modelData = try decoder.decode(TypePokeModel.self, from: data)
//                    completion(modelData)
//                } catch {
//                    completion(nil)
//                }
//            }
//        }.resume()
//
//    }
//
//    func callApiDetail(completion: @escaping(PokemonDetailModel?)-> Void) {
//        guard let url = URL(string: self.url) else {return}
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder ()
//                    let modelData = try decoder.decode(PokemonDetailModel.self, from: data)
//                    completion(modelData)
//                } catch {
//                    completion(nil)
//
//                }
//            }
//        }
//    }
//
//
//}


