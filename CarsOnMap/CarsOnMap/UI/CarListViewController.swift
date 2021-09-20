//
//  CarListViewController.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 18/9/21.
//

import UIKit

final class CarListViewController: UIViewController {
        
    static func configureWith(with cars: Cars) -> CarListViewController {
        let viewController = Storyboard.Main.instantiate(CarListViewController.self)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Car List"
    }
}

