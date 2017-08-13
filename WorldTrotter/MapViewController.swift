//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Roman on 8/13/17.
//  Copyright © 2017 Ivanov. All rights reserved.
//

import UIKit
import MapKit

class MapViewController:UIViewController{
    var MapView:MKMapView!
    
    override func loadView() {
        MapView = MKMapView()
        
        view = MapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybride", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: "mapTypeChanged", forControlEvents: .ValueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        // creating constraints to the segmentedControl
        //let topContraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
        let topContraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingContraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingContraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        // activating the contraints
        topContraint.active = true
        leadingContraint.active = true
        trailingContraint.active = true
    }
    
    func mapTypeChanged(segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0:MapView.mapType = .Standard
        case 1:MapView.mapType = .Hybrid
        case 2:MapView.mapType = .Satellite
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
}
