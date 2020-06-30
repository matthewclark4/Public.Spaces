//
//  GalleryCollectionViewCell.swift
//  PublicSpaces
//
//  Created by Matthew Clark on 09/04/2020.
//  Copyright © 2020 Matthew Clark. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - "IBOutlets"
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageViewContainer: UIImageView!
    
    // MARK: - CellLifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupBackgroundView()
    }
    
    private func setupBackgroundView() {
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 20
        bgView.layer.borderWidth = 1.5
        bgView.clipsToBounds = true
        bgView.layer.borderColor = UIColor(red: 0.496, green: 1, blue: 0.496, alpha: 1).cgColor

    }
}
