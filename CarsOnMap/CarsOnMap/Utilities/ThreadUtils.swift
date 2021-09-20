//
//  ThreadUtils.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 18/9/21.
//

import Foundation

/// Executes provided closure on main thred
///
/// - Parameter workItem: Work item closure to be executed
func performOnMain(_ workItem: @escaping () -> Void) {
    if Thread.isMainThread {
        workItem()
    } else {
        DispatchQueue.main.async {
            workItem()
        }
    }
}
