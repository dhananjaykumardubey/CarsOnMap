//
//  VehicleCell.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 20/9/21.
//

import UIKit

final class VehicleCell: UITableViewCell {
    
    @IBOutlet private weak var rootView: UIView!
    @IBOutlet private weak var vehicleImageView: UIImageView!
    @IBOutlet private weak var licencePlate: UILabel!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var fuelTypeImageView: UIImageView!
    @IBOutlet private weak var groupName: UILabel!
    @IBOutlet private weak var cleaniness: UILabel!
    
    /**
     Configure cell with Car data
     - parameters:
     - data: Car data
     */
    func configure(with data: Car) {
       

        self.layoutIfNeeded()
    }
}
