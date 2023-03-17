//
//  PokemonDetailsViewController.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 17/03/23.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pokemon: Results?
    
    var viewModel: PokemonDetailViewModel?
    var detailPokemon: PokemonDetailModel?
    
    var pokemonUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViewModel()
    }
    
    func setupViewModel() {
        //        self.userPostViewModel = UserPostViewModel (url:"https://jsonplaceholder.typicode.com/posts")
//        if let pokemonModel = pokemon {
//            pokemonUrl = "https://pokeapi.co/api/v2/pokemon/\(pokemonModel.name)/"
//        }
        
        func bindDataToController() {
            //            if let PokemonDetailModel = PokemonDetailModel{
            //                //            print(userPostModel)
            ////                self.tableView.backgroundColor = .white
            //                print ("reload data")
            //                DispatchQueue.main.async {
            //                    self.tableView.reloadData()
            //                }
            //            } else {
            //                self.tableView.backgroundColor = .blue
            //            }
        }
        
        self.viewModel = PokemonDetailViewModel(urlString: pokemon!.url, apiService: GetPokemonApi())
        //        self.viewModel = PokemonDetailViewModel = bindDetailPokemonData
        self.viewModel?.bindDetailPokemonData = { dataDetailPokemon in
            if let dataDetailPokemon = dataDetailPokemon {
                self.detailPokemon = dataDetailPokemon
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: PokemonDetailsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PokemonDetailsTableViewCell.identifier)
    }
}

extension PokemonDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonDetailsTableViewCell.identifier, for: indexPath) as? PokemonDetailsTableViewCell else { return UITableViewCell() }
        
        cell.nameLabel.text = detailPokemon?.name
        cell.statLabel.text = "\(String(describing: detailPokemon?.stats[0].baseStat ?? 0))"
        cell.spritesImage.sd_setImage(with: URL(string: (detailPokemon?.sprites.frontDefault)!))
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
