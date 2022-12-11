//
//  TopicsCollectionViewCell.swift
//  VKCupMobileQual
//
//  Created by Arina Postnikova on 7.12.22.
//

import UIKit

class TopicsCollectionViewCell: UICollectionViewCell {

    // MARK: - Public properties
    static let identifier = "TopicsCollectionViewCell"
    
    // MARK: - IBOutlets
    @IBOutlet weak var topicLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Public methods
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func setup(with text: String) {
        topicLabel.text = text
    }
}
