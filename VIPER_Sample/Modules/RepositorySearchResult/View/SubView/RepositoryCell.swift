//
//  RepositoryCell.swift
//  VIPER_Sample
//
//  Created by park kyung suk on 2021/02/26.
//

import UIKit

class RepositoryCell: UITableViewCell, NibRegistrable {

    @IBOutlet private weak var repositoryNameLabel: UILabel!
    @IBOutlet private weak var starCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRepository(_ repository: RepositoryEntity) {
        repositoryNameLabel.text = repository.fullName
        starCountLabel.text = "\(repository.starCount)"
    }
    
}
