//
//  LaunchCollectionViewCell.swift
//  PublicSpaces
//
//  Created by Matthew Clark on 09/04/2020.
//  Copyright © 2020 Matthew Clark. All rights reserved.
//

import UIKit

class LaunchCollectionViewCell: UICollectionViewCell {
    
    // MARK: - "IBOutlets"
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var placeNameLbl: UILabel!
    @IBOutlet weak var milesLbl: UILabel!
    @IBOutlet weak var placeOwnerLbl: UILabel!
    @IBOutlet weak var arBtn: UIButton!
    
    // MARK: - iVars
    
    let gradientLayer: CAGradientLayer = CAGradientLayer()
    
    // MARK: - CellLifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
     
        self.setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = self.bgView.frame
    }
    
    // MARK: - Helper Methods
    
    private func setup() {
        self.setupBackgroundView()
        self.setupTextLbl()
    }
    
    private func setupBackgroundView() {
        bgView.backgroundColor = .clear
        bgView.layer.cornerRadius = 15
        bgView.layer.borderWidth = 3
        bgView.clipsToBounds = true
        bgView.layer.borderColor = UIColor(red: 0.496, green: 1, blue: 0.496, alpha: 1).cgColor
        
//        bgView.addGradientView()
//        self.addGradiend()
    }
    
    private func setupTextLbl() {
        placeNameLbl.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        placeNameLbl.font = UIFont(name: PSFonts.psFontName, size: 13)
        placeNameLbl.numberOfLines = 0
        placeNameLbl.lineBreakMode = .byWordWrapping
        placeNameLbl.textAlignment = .center
        
        milesLbl.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        milesLbl.font = UIFont(name: PSFonts.psFontName, size: 13)
        milesLbl.numberOfLines = 0
        milesLbl.lineBreakMode = .byWordWrapping
        milesLbl.textAlignment = .center
        
        placeOwnerLbl.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        placeOwnerLbl.font = UIFont(name: PSFonts.psFontName, size: 13)
        placeOwnerLbl.numberOfLines = 0
        placeOwnerLbl.lineBreakMode = .byWordWrapping
        placeOwnerLbl.textAlignment = .center
    }

    func addGradiend() {

        //A linear Gradient Consists of two colours: top colour and bottom colour
        let topColor = UIColor(red: 0.0/255.0, green: 255.0/255.0, blue: 0.0/255.0, alpha: 0.4)
        let bottomColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)

        //Add the top and bottom colours to an array and setup the location of those two.
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [CGFloat] = [0.0, 1.0]

        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]

        gradientLayer.frame = bgView.bounds
        bgView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
