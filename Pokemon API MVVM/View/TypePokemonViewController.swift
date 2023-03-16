//
//  TypePokemonViewController.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 16/03/23.
//

import UIKit

class TypePokemonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    var viewModel: TypePokemonViewModel?
    var pokemon: TypePokeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: PokemonListCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PokemonListCollectionViewCell.identifier)
        
        self.viewModel = TypePokemonViewModel(urlString : "https://pokeapi.co/api/v2/pokemon")
        
        self.viewModel?.bindTypePokemonData = {pokemonDataListModel in
            print("this is the data: \(pokemonDataListModel)")
            if let pokemonDataListModel = pokemonDataListModel{
                self.pokemon = pokemonDataListModel
                self.collectionView.backgroundColor = .blue
            } else {
                self.collectionView.backgroundColor = .red
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = self.pokemon?.results.count ?? 0
        print (count)
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListCollectionViewCell.identifier, for: indexPath) as? PokemonListCollectionViewCell else { return UICollectionViewCell()}
        cell.nameLabel.text = pokemon?.results[indexPath.row].name
        return cell
    }
}
