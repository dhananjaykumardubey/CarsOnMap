//
//  RootViewModel.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 18/9/21.
//

import Foundation

final class RootViewModel {
    
    // MARK: Callbacks or observers
    /// Callback for showing the error message
    var showError: ((String) -> Void)?
    
    /// Callback returning cars as datasource
    var cars: (([Car]) -> Void)?

    // MARK: Private properties
    private let apiClient: APIClient?
    private lazy var carList: [Car] = []
    
    // MARK: Initializers
    init(with apiClient: APIClient?) {
        self.apiClient = apiClient
    }
    
    convenience init(with cars: Cars) {
        self.init(with: nil)
        self.carList = cars
    }
    
    // MARK: Exposed functions to view controlelrs
    
    /// BindViewModel call to let viewmodel know that bindViewModel of viewcontroller is called and completed and properties can be observed
    func bindViewModel() {
        self.fetchCars()
    }
    
    /// Fetch cars from local file
    func fetchCars() {
        DispatchQueue.global(qos: .userInteractive).async {
            self.apiClient?.fetchCarList({ [weak self] response in
                performOnMain {
                    guard let _self = self else {
                        return
                    }
                    switch response {
                    case let .success(cars):
                        if !cars.isEmpty {
                            _self.carList = cars
                            _self.cars?(cars)
                        } else {
                            _self.showError?(NetworkErrors.ResponseError.noDataAvailable.errorDescription ?? "")
                        }
                    case let .failure(error):
                        _self.showError?(error.localizedDescription)
                    }
                }
            })
        }
    }
}
