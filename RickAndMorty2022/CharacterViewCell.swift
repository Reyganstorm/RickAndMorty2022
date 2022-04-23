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
    @IBOutlet weak var characterImage: UIImageView! {
        didSet {
            //characterImage.contentMode = .scaleAspectFit
            characterImage.layer.cornerRadius = characterImage.bounds.height/2
        }
    }
    
    func configure(with character: Character?) {
        self.descriptionLabel.text =
        """
        N: \(character?.name ?? "")
        S: \(character?.species ?? "")
        G: \(character?.gender ?? "")
        """
        
        fetchImage(from: character?.image ?? "")
    }
    
    private func fetchImage(from url: String) {
        guard let url = URL(string: url) else {return}
        
        ImageManager.shared.fetchImage(from: url) { data, response in
            self.characterImage.image = UIImage(data: data)
        }
    }
}
