//
//  MapViewModel.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 18/9/21.
//

import Foundation
import UIKit.UIImage
import CoreLocation

class MapViewModel {
    
    // MARK: Callbacks or observers
    
    /// Callback returning the map item
    var mapItems: (([MapItem]) -> Void)?
    
    //MARK: Private properties
    private let cars: Cars?
    private let imageFetcher: ImageFetcher?
    
    required init(with cars: Cars, imageFetcher: ImageFetcher? = nil) {
        self.cars = cars
        self.imageFetcher = imageFetcher
    }
    
    //MARK: Exposed functions
    
    /// BindViewModel call to let viewmodel know that bindViewModel of viewcontroller is called and completed and properties can be observed
    func bindViewModel() {
        self.parseCarDetails(self.cars)
    }
    
    //    func selectedMapItem(mapItem: MapItem) {
    //        guard let image = mapItem.image else {
    //            self.cameraImage?(UIImage(named: "placeholder"))
    //            return
    //        }
    //
    //        self.imageFetcher?.fetchContent(image) { [weak self] response in
    //            switch response {
    //            case let .success(image):
    //                self?.cameraImage?(image)
    //            case .failure(_):
    //                self?.cameraImage?(UIImage(named: "placeholder"))
    //            }
    //        }
    //    }
    //
    func parseCarDetails(_ cars: Cars?) {
        guard let cars = cars, !cars.isEmpty
        else { return }
        
        let mapItems = cars.compactMap { item -> MapItem in
            return MapItem(coordinate: CLLocationCoordinate2D(latitude: item.latitude,
                                                              longitude: item.longitude),
                           image: Image.init(item.carImageURL),
                           title: item.licensePlate)
        }
        self.mapItems?(mapItems)
    }
}
