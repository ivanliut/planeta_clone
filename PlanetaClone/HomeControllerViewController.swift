//
//  HomeControllerViewController.swift
//  PlanetaClone
//
//  Created by Ivan Liutko on 3/22/20.
//  Copyright © 2020 Ivan Liutko. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class HomeControllerViewController: UIViewController {
    
    let rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("BlockBuster", for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.addTarget(self, action: #selector(handleRightButtonPress), for: .touchUpInside)
        return button
    }()
    
    @objc func handleRightButtonPress() {
       
    }
    
    let leftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menu"), for: .normal)
//        button.setTitle("BlockBuster", for: .normal)
        
        button.setTitleColor(.lightGray, for: .highlighted)
        button.addTarget(self, action: #selector(handleLeftButtonPress), for: .touchUpInside)
        return button
    }()
    
    @objc func handleLeftButtonPress() {
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        // add subviews
        view.addSubview(rightButton)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        rightButton.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor).isActive = true
        
        
        view.addSubview(leftButton)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        leftButton.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        leftButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        // Do any additional setup after loading the view.
        // add child view controller
        let layout = UPCarouselFlowLayout()
       layout.scrollDirection = .horizontal
       layout.spacingMode = UPCarouselFlowLayoutSpacingMode.fixed(spacing: 0)

       layout.sideItemScale = 0.8

       layout.scrollDirection = .horizontal
        let carouselController = MainCollectionController(collectionViewLayout: layout)
        addChild(carouselController)
        view.addSubview(carouselController.view)
        carouselController.collectionView.backgroundColor = .purple
        carouselController.didMove(toParent: self)
        
        // constraints
        setupConstraintsForChildController(carouselController: carouselController)

    }
    
    fileprivate func setupConstraintsForChildController(carouselController: UICollectionViewController) {
        carouselController.view.translatesAutoresizingMaskIntoConstraints = false
        carouselController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        carouselController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        carouselController.view.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        carouselController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
    }
    
}
