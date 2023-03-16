//
//  PokemonListCollectionViewCell.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 15/03/23.
//

import UIKit

class PokemonListCollectionViewCell: UICollectionViewCell {
    static let identifier = "PokemonListCollectionViewCell"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
