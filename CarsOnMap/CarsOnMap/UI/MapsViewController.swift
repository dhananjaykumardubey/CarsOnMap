//
//  MapsViewController.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 18/9/21.
//

import Foundation
import UIKit
import MapKit

final class MapsViewController: UIViewController {
        
    @IBOutlet private weak var mapView: MKMapView!
    
    private var viewModel: MapViewModel?
    
    static func configureWith(with cars: Cars) -> MapsViewController {
        let viewController = Storyboard.Main.instantiate(MapsViewController.self)
        viewController.viewModel = MapViewModel(with: cars, imageFetcher: ImageFetcher())
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        self.mapView.register(CarAnnotationView.self, forAnnotationViewWithReuseIdentifier: "carAnnotation")
        self.mapView.register(ClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: "clusterAnnotation")

        self.bindViewModel()
    }
    
    private func bindViewModel() {

        self.viewModel?.mapItems = { [weak self] items in
            guard let _self = self else { return }
            performOnMain {
                _self.mapView.addAnnotations(items)
                self?.mapView.setCenter(items.first?.coordinate ?? CLLocationCoordinate2D.init(), animated: true)
            }
        }
        
        self.viewModel?.bindViewModel()
    }
}

extension MapsViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        switch annotation {
        case is MapItem:
            var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "carAnnotation") as? CarAnnotationView
            if annView == nil {
                annView = CarAnnotationView(annotation: annotation, reuseIdentifier: "carAnnotation")
            }
            annView?.clusteringIdentifier = "clusterAnnotation"
            annView?.annotation = annotation
          return annView
        case is MKClusterAnnotation:
          var view = mapView.dequeueReusableAnnotationView(withIdentifier: "clusterAnnotation") as? ClusterAnnotationView
            if view == nil {
                view = ClusterAnnotationView(annotation: annotation, reuseIdentifier: "clusterAnnotation")
            }
          view?.annotation = annotation
            return view
        default:
          return nil
        }
     }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        switch view {
        case is ClusterAnnotationView:
            // if the user taps a cluster, zoom in
            let currentSpan = mapView.region.span
            let zoomSpan = MKCoordinateSpan(latitudeDelta: currentSpan.latitudeDelta / 2.0, longitudeDelta: currentSpan.longitudeDelta / 2.0)
            let zoomCoordinate = view.annotation?.coordinate ?? mapView.region.center
            let zoomed = MKCoordinateRegion(center: zoomCoordinate, span: zoomSpan)
            mapView.setRegion(zoomed, animated: true)
            
        case is CarAnnotationView:
            // is user taps on pin, then show the image
            guard let annotation = view.annotation as? MapItem else { return }
//            self.viewModel.selectedMapItem(mapItem: annotation)
        default: return
            
        }
    }
}
