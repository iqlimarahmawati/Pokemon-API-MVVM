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
    @IBOutlet weak var bgView: UIView!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell() {
        bgView.layer.backgroundColor = UIColor.white.cgColor
        bgView.layer.borderWidth = 1.0
        bgView.layer.borderColor = UIColor.black.cgColor
    
    }

}
