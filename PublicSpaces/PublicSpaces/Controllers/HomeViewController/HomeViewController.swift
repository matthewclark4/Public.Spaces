//
//  HomeViewController.swift
//  PublicSpaces
//
//  Created by Matthew Clark on 09/04/2020.
//  Copyright © 2020 Matthew Clark. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var listBtn: UIButton!
    @IBOutlet weak var mapBtn: UIButton!
    @IBOutlet weak var galleryBtn: UIButton!
    @IBOutlet weak var aboutBtn: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - iVar
    
    private var selectedNavBtnIndex: Int = 0
    
    private lazy var launchVC: LaunchViewController = {
        
        var viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LaunchViewController") as! LaunchViewController
        
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var mapVC: MapViewController = {

        var viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController

        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var galleryVC: GalleryViewController = {
        
        var viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
        
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var aboutVC: AboutViewController = {
        
        var viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    // To Set Status Bar Text Color White
    // To Match Mock-Ups
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Helper Methods
    
    private func setupUI() {
        self.containerView.backgroundColor = .clear
        self.add(asChildViewController: self.launchVC)
        
        setupStatusBar()
        setupNavButtons()
        self.customizeNavButtons()
    }
    
    private func setupNavButtons() {
        self.listBtn.layer.cornerRadius = 5.0
        self.mapBtn.layer.cornerRadius = 5.0
        self.galleryBtn.layer.cornerRadius = 5.0
        self.aboutBtn.layer.cornerRadius = 5.0
        
        self.listBtn.setTitle(NSLocalizedString("list", comment: ""), for: .normal)
        self.mapBtn.setTitle(NSLocalizedString("map", comment: ""), for: .normal)
        self.galleryBtn.setTitle(NSLocalizedString("gallery", comment: ""), for: .normal)
        self.aboutBtn.setTitle(NSLocalizedString("about", comment: ""), for: .normal)
        
        self.listBtn.titleLabel?.font = UIFont(name: PSFonts.psFontName, size: PSFonts.psBtnFontSize)
        self.mapBtn.titleLabel?.font = UIFont(name: PSFonts.psFontName, size: PSFonts.psBtnFontSize)
        self.galleryBtn.titleLabel?.font = UIFont(name: PSFonts.psFontName, size: PSFonts.psBtnFontSize)
        self.aboutBtn.titleLabel?.font = UIFont(name: PSFonts.psFontName, size: PSFonts.psBtnFontSize)
    }
    
    private func customizeNavButtons() {
        self.resetNavButtons()
        
        switch self.selectedNavBtnIndex {
        
        case 1:
            self.mapBtn.setTitleColor(UIColor.PSSelectedBtnTxtColor, for: .normal)
            self.mapBtn.backgroundColor = UIColor.PSSelectedBtnBackgroundColor
            break
        case 2:
            self.galleryBtn.setTitleColor(UIColor.PSSelectedBtnTxtColor, for: .normal)
            self.galleryBtn.backgroundColor = UIColor.PSSelectedBtnBackgroundColor
            break
        case 3:
            self.aboutBtn.setTitleColor(UIColor.PSSelectedBtnTxtColor, for: .normal)
            self.aboutBtn.backgroundColor = UIColor.PSSelectedBtnBackgroundColor
            break
        default:
            self.listBtn.setTitleColor(UIColor.PSSelectedBtnTxtColor, for: .normal)
            self.listBtn.backgroundColor = UIColor.PSSelectedBtnBackgroundColor
            break
        }
    }
    
    private func handleContainerView() {
        self.remove(asChildViewController: self.launchVC)
        self.remove(asChildViewController: self.mapVC)
        self.remove(asChildViewController: self.galleryVC)
        self.remove(asChildViewController: self.aboutVC)
        
        switch self.selectedNavBtnIndex {
        case 1:
            self.add(asChildViewController: self.mapVC)
            break
        case 2:
            self.add(asChildViewController: self.galleryVC)
            break
        case 3:
            self.add(asChildViewController: self.aboutVC)
            break
        default:
            self.add(asChildViewController: self.launchVC)
            break
        }
    }
    
    private func resetNavButtons() {
        self.listBtn.setTitleColor(UIColor.PSNormalBtnTextColor, for: .normal)
        self.mapBtn.setTitleColor(UIColor.PSNormalBtnTextColor, for: .normal)
        self.galleryBtn.setTitleColor(UIColor.PSNormalBtnTextColor, for: .normal)
        self.aboutBtn.setTitleColor(UIColor.PSNormalBtnTextColor, for: .normal)
        
        self.listBtn.backgroundColor = UIColor.PSNormalBtnBackgroundColor
        self.mapBtn.backgroundColor = UIColor.PSNormalBtnBackgroundColor
        self.galleryBtn.backgroundColor = UIColor.PSNormalBtnBackgroundColor
        self.aboutBtn.backgroundColor = UIColor.PSNormalBtnBackgroundColor
    }
    
    // MARK: - Set Status Bar
    
    private func setupStatusBar() {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = UIColor.black
            view.addSubview(statusbarView)
          
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
          
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = UIColor.black
        }
    }
    
    // MARK: - Navigation Helpers
    
    private func add(asChildViewController viewController: UIViewController) {
        
        addChild(viewController)
        
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        containerView.addSubview(viewController.view)
        
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    // MARK: - IBActions
    
    @IBAction func navBarButtonDidTapped(_ sender: UIButton) {
        self.selectedNavBtnIndex = sender.tag
        self.customizeNavButtons()
        self.handleContainerView()
    }
}
