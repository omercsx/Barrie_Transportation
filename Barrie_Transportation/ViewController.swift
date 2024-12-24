//
//  ViewController.swift
//  Barrie_Transportation
//
//  Created by Omer Cagri Sayir on 24.12.2024.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Class Variables
    var model = BTS_Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Barrie GPS coords
        let barrieLatitude = 44.389355
        let barrieLongitude = -79.690331
        let meter = CLLocationDistance(10_000)
        
        let barrieLocation = CLLocationCoordinate2D(latitude: barrieLatitude, longitude: barrieLongitude)
        let barrieRegion = MKCoordinateRegion(center: barrieLocation,
                                              latitudinalMeters: meter,
                                              longitudinalMeters: meter)
        
        mapView.setRegion(barrieRegion, animated: true)
        
        for driver in model.drivers {
            let random1 = Double.random(in: -0.05...0.05)
            let random2 = Double.random(in: -0.05...0.05)
            
            let randomLocation = CLLocationCoordinate2D(latitude: barrieLatitude + random1,
                                                        longitude: barrieLongitude + random2)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = randomLocation
            annotation.title = driver.key
            annotation.subtitle = driver.value
            mapView.addAnnotation(annotation)
        }
        
    }


}

