//
//  TypePokemonViewController.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 16/03/23.
//

import UIKit
import SDWebImage

class TypePokemonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    var viewModel: TypePokemonViewModel?
    var pokemon: TypePokeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPokemon()
        self.viewModel = TypePokemonViewModel(urlString : "https://pokeapi.co/api/v2/pokemon", apiService: GetPokemonApi())
        
        
        self.viewModel?.bindTypePokemonData = {pokemonDataListModel in
            print("this is the data: \(pokemonDataListModel)")
            if let pokemonDataListModel = pokemonDataListModel{
                self.pokemon = pokemonDataListModel
                self.collectionView.backgroundColor = .white
            } else {
                self.collectionView.backgroundColor = .white
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
       
    }
    
    func setUpPokemon() {
        collectionView.collectionViewLayout = setUpPokemonCellFlowLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: PokemonListCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PokemonListCollectionViewCell.identifier)
    }
    
    func setUpPokemonCellFlowLayout() -> UICollectionViewLayout {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        let  screenSize = self.view.bounds.size.width - flowlayout.sectionInset.left -
        flowlayout.sectionInset.right - flowlayout.minimumInteritemSpacing
        
        flowlayout.itemSize = CGSize(width: screenSize / 2, height: 250)
        
        return flowlayout
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pokemon?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListCollectionViewCell.identifier, for: indexPath) as? PokemonListCollectionViewCell else { return UICollectionViewCell()}
            cell.nameLabel.text = pokemon?.results[indexPath.row].name
            cell.image.sd_setImage(with: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexPath.row + 1).png"))
            
        return cell
        }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let count = self.pokemon?.results.count ?? 0
        print (count)
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PokemonDetailsViewController") as! PokemonDetailsViewController
        viewController.pokemon = self.pokemon?.results[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    }

// cara add Package
//file -> add packages/ swift packages -> copy paste url nya -> jangan lupa import
// contoh mau add packages SDWeb atau Algoritma, copy pastenya di add packages seetelah itu import di viewController lalu panggil link githubnya
