//
//  PokemonDetailsTableViewCell.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 17/03/23.
//

import UIKit

class PokemonDetailsTableViewCell: UITableViewCell {

    static let identifier = "PokemonDetailsTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statLabel: UILabel!
    @IBOutlet weak var spritesImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
