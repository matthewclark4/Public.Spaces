//
//  LaunchViewController.swift
//  PublicSpaces
//
//  Created by Matthew Clark on 08/04/2020.
//  Copyright © 2020 Matthew Clark. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - iVars
    
    private let addresses: [String] = [NSLocalizedString("Coal Drops", comment: ""), NSLocalizedString("Paternoster Square", comment: ""), NSLocalizedString("Greenwich Peninsula", comment: ""), NSLocalizedString("St. Martin's Courtyard", comment: ""), NSLocalizedString("Jubilee Park", comment: ""), NSLocalizedString("Bankside", comment: ""), NSLocalizedString("Regents Place", comment: ""), NSLocalizedString("More London", comment: ""), NSLocalizedString("Merchant Square", comment: "")]
    
    private let placeNames: [String] = [NSLocalizedString("place_name_1", comment: ""),
                                        NSLocalizedString("place_name_2", comment: ""),
                                        NSLocalizedString("place_name_3", comment: ""),
                                        NSLocalizedString("place_name_4", comment: ""),
                                        NSLocalizedString("place_name_5", comment: ""),
                                        NSLocalizedString("place_name_6", comment: ""),
                                        NSLocalizedString("place_name_7", comment: ""),
                                        NSLocalizedString("place_name_8", comment: ""),
                                        NSLocalizedString("place_name_9", comment: "")]
    
    private let miles: [String] = [NSLocalizedString("miles_1", comment: ""),
                                   NSLocalizedString("miles_2", comment: ""),
                                   NSLocalizedString("miles_3", comment: ""),
                                   NSLocalizedString("miles_4", comment: ""),
                                   NSLocalizedString("miles_5", comment: ""),
                                   NSLocalizedString("miles_6", comment: ""),
                                   NSLocalizedString("miles_7", comment: ""),
                                   NSLocalizedString("miles_8", comment: ""),
                                   NSLocalizedString("miles_9", comment: "")]
    
    private let placeOwners: [String] = [NSLocalizedString("place_owner_name_1", comment: ""),
                                         NSLocalizedString("place_owner_name_2", comment: ""),
                                         NSLocalizedString("place_owner_name_3", comment: ""),
                                         NSLocalizedString("place_owner_name_4", comment: ""),
                                         NSLocalizedString("place_owner_name_5", comment: ""),
                                         NSLocalizedString("place_owner_name_6", comment: ""),
                                         NSLocalizedString("place_owner_name_7", comment: ""),
                                         NSLocalizedString("place_owner_name_8", comment: ""),
                                         NSLocalizedString("place_owner_name_9", comment: "")]
    
    // MARK: - ViewLifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUI()
    }
    
    // MARK: - Helper Methods
    
    private func setupUI() {
        self.setupLabels()
        self.setupCollectionView()
    }
    
    private func setupLabels() {
        self.headerLbl.text = NSLocalizedString("click to add layer", comment: "")
        self.headerLbl.font = UIFont(name: PSFonts.psFontName, size: 17.0)
        
    }

    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "LaunchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LaunchCollectionViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        
        self.collectionView.reloadData()
    }
    
    private func moveToARView() {
        if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @objc func cellARBtnDidTapped(_ sender: UIButton) {
        moveToARView()
    }
}

extension LaunchViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addresses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LaunchCollectionViewCell", for: indexPath) as? LaunchCollectionViewCell else { fatalError("Unexpected Table View Cell")
        }
        
        cell.placeNameLbl.text = self.placeNames[indexPath.row]
        cell.milesLbl.text = self.miles[indexPath.row]
        cell.placeOwnerLbl.text = self.placeOwners[indexPath.row]
        
        cell.arBtn.tag = indexPath.row
        cell.arBtn.addTarget(self, action: #selector(cellARBtnDidTapped(_ :)), for: .touchUpInside)

        cell.contentView.backgroundColor = .clear
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        return CGSize(width: 100, height: 160)
        return CGSize(width: ((collectionView.frame.size.width - 20) / 3), height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
}
