//
//  CharacterViewCell.swift
//  RickAndMorty2022
//
//  Created by Руслан Штыбаев on 23.04.2022.
//

import UIKit

class CharacterViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    func configure(with character: Character?) {
        self.descriptionLabel.text =
        """
        N: \(character?.name ?? "")
        S: \(character?.species ?? "")
        G: \(character?.gender ?? "")
        """
    }
    
}