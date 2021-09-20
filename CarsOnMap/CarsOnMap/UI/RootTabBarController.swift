//
//  RootTabBarController.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 18/9/21.
//

import Foundation
import UIKit

final class RootTabBarController: UITabBarController {

    private let viewModel = RootViewModel(with: CarApiClient(baseURL: NetworkConstant.baseURL))
    
    private var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
    }

    private func bindViewModel() {

        self.viewModel.showError = { [weak self] message in
            guard let _self = self else { return }
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(action)
            _self.present(alertController, animated: true)
        }

        self.viewModel.cars = { [weak self] cars in
            guard let _self = self else { return }
            print("cars fetched")
            _self.configure(with: cars)
        }
        self.viewModel.bindViewModel()
    }
    
    public func configure(with cars: Cars) {
        
        UITabBar.appearance().tintColor = .systemRed
        
        var viewControllers: [UIViewController] = []
        
        let navEmergency = setupNavigationController(
            CarListViewController.configureWith(with: cars),
            title: "List",
            image: nil
        )
        viewControllers.append(navEmergency)
        
        
        let maps = setupNavigationController(
            MapsViewController.configureWith(with: cars),
            title: "Maps",
            image: nil
        )
        viewControllers.append(maps)

        self.viewControllers = viewControllers
        self.modalPresentationStyle = .fullScreen
        self.modalTransitionStyle = .crossDissolve
        
    }
    
    private func setupNavigationController(_ viewController: UIViewController,
                                           title: String,
                                           image: UIImage?) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: viewController)
        let item = UITabBarItem(
            title: title,
            image: image,
            selectedImage: image
        )
        nav.tabBarItem = item
        
        return nav
    }
}
