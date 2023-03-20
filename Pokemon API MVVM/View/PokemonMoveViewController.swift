//
//  PokemonMoveViewController.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 20/03/23.
//

import UIKit

class PokemonMoveViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonMoveTableViewCell.identifier, for: indexPath) as? PokemonMoveTableViewCell else {
            return UITableViewCell()}
        
        cell.PowerLabel.text = "\(movePokemon?.power)"
        cell.AccuracyLabel.text = "\(movePokemon?.accuracy)"
        
        return cell
    }

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: PokemonMoveViewModel?
    var movePokemon:PokemonMoveModel?
    var pokemon : Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupViewModel()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: PokemonMoveTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PokemonMoveTableViewCell.identifier)

}
    func  setupViewModel(){
        self.viewModel = PokemonMoveViewModel(urlString: pokemon!.url, apiService: GetPokemonApi())
        self.viewModel?.bindMovePokemonData = {dataMovePokemon in
            if let dataMovePokemon = dataMovePokemon {
                self.movePokemon =  dataMovePokemon
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

