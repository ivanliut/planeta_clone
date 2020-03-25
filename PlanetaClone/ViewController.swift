//
//  ViewController.swift
//  PlanetaClone
//
//  Created by Ivan Liutko on 3/22/20.
//  Copyright © 2020 Ivan Liutko. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        
        let layout = UPCarouselFlowLayout()
                   layout.scrollDirection = .horizontal
                   layout.spacingMode = UPCarouselFlowLayoutSpacingMode.fixed(spacing: 0)
         
                   layout.sideItemScale = 0.8

                   layout.scrollDirection = .horizontal
        
        let carouselView = MainCollectionController(frame: .init(x: 0, y: 0, width: 200, height: 300), collectionViewLayout: layout)
//        let carouselView = MainCollectionController(collectionViewLayout: layout)
        let middleView = UIView()
        middleView.addSubview(carouselView)
        carouselView.widthAnchor.constraint(equalTo: middleView.widthAnchor).isActive = true
        carouselView.heightAnchor.constraint(equalTo: middleView.heightAnchor).isActive = true
        let verticalStackView = UIStackView(arrangedSubviews: [UIView(), carouselView, UIView()])
        view.addSubview(verticalStackView)
        
        
        // Do any additional setup after loading the view.
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
