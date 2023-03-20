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
    
    //    var viewModel: PokemonMoveViewModel?
    //    var movePokemon:PokemonMoveModel?
    //    var pokemon : Results?
    
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
        tableView.register(UINib(nibName: "PokemonMoveTableViewCell", bundle: nil), forCellReuseIdentifier: PokemonMoveTableViewCell.identifier)
    }
}

extension PokemonDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonDetailsTableViewCell.identifier, for: indexPath) as? PokemonDetailsTableViewCell else { return UITableViewCell() }
            
            cell.nameLabel.text = detailPokemon?.name
            cell.statLabel.text = "\(String(describing: detailPokemon?.stats[0].baseStat ?? 0))"
            cell.spritesImage.sd_setImage(with: URL(string: (detailPokemon?.sprites.frontDefault) ?? ""))
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonMoveTableViewCell.identifier, for: indexPath) as? PokemonMoveTableViewCell else {
                return UITableViewCell()}

            cell.PowerLabel.text = "\(String(describing: detailPokemon?.moves[indexPath.row].move.name ?? "" ))"
//            cell.AccuracyLabel.text = "\(String(describing: detailPokemon?.moves.name ?? "" ))"
            return cell
        default:
            break
            
        }
        return UITableViewCell()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return detailPokemon?.moves.count ?? 0
        default:
            return 1
            //        case 1:
            //            return 3
            //        }
        }
        

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2    }
    

}
