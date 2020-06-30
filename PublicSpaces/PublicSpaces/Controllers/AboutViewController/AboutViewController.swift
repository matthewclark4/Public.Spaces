//
//  AboutViewController.swift
//  PublicSpaces
//
//  Created by Matthew Clark on 09/04/2020.
//  Copyright © 2020 Matthew Clark. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    // MARK: -
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var aboutLbl: UILabel!
    
    // MARK: -
    
    // MARK: -

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: -
    
    private func setupUI() {
        setupLabels()
        setupBgView()
    }
    
    private func setupLabels() {
        aboutLbl.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        aboutLbl.font = UIFont(name: PSFonts.psFontName, size: 17)
        aboutLbl.numberOfLines = 0
        aboutLbl.lineBreakMode = .byWordWrapping
        aboutLbl.textAlignment = .left
        
        aboutLbl.text = NSLocalizedString("about_text", comment: "")
    }
    
    private func setupBgView() {
        bgView.layer.cornerRadius = 50.0
        bgView.backgroundColor = .clear
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
