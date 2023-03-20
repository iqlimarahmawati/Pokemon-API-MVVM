//
//  PokemonMoveTableViewCell.swift
//  Pokemon API MVVM
//
//  Created by Phincon on 20/03/23.
//

import UIKit

class PokemonMoveTableViewCell: UITableViewCell {
    
    static let identifier = "PokemonMoveTableViewCell"

    @IBOutlet weak var PowerLabel : UILabel!
    @IBOutlet weak var AccuracyLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
