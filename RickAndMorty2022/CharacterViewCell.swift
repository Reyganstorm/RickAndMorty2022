//
//  CharacterViewCell.swift
//  RickAndMorty2022
//
//  Created by Руслан Штыбаев on 23.04.2022.
//

import UIKit

class CharacterViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var characterImage: CharacterImageView! {
        didSet {
            characterImage.layer.cornerRadius = characterImage.bounds.height/2
        }
    }
    
    func configure(with character: Character?) {
        self.nameLabel.text = character?.name ?? ""
        self.descriptionLabel.text =
        """
        \(character?.species ?? "")
        \(character?.gender ?? "")
        """
        
        characterImage.fetchImage(from: character?.image ?? "")
    }
}
