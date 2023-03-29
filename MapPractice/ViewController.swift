//
//  ViewController.swift
//  MapPractice
//
//  Created by Shahnewaz on 5/3/23.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet weak var gooleMapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    
        let dhakaLocations = [
            ["name": "Dhaka University", "lat": 23.7291, "long": 90.3959],
            ["name": "Bangladesh National Museum", "lat": 23.7325, "long": 90.3941],
            ["name": "Dhakeshwari Temple", "lat": 23.7088, "long": 90.4067],
            ["name": "Ahsan Manzil", "lat": 23.7099, "long": 90.4072],
            ["name": "Lalbagh Fort", "lat": 23.7196, "long": 90.3859]
        ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Request permission to use location services
            locationManager.requestWhenInUseAuthorization()
            
            // Set the delegate to receive location updates
            locationManager.delegate = self
            
            // Start updating the user's location
            locationManager.startUpdatingLocation()
            
            // Show the Dhaka locations on the map
            showDhakaLocations()
        }
        
        // MARK: - CLLocationManagerDelegate
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else {
                return
            }
            
            // Animate the camera to the user's current location
            //let camera = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 13)
            
            // Animate the camera to a specific location as gps doesn't work on simulation
            let camera = CLLocationCoordinate2D(latitude: 23.7099, longitude: 90.4072)
            
            gooleMapView.animate(toLocation: camera)
            gooleMapView.animate(toZoom: 13)
            
            // Stop updating the location to conserve battery life
            locationManager.stopUpdatingLocation()
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to get user's location: \(error.localizedDescription)")
        }
        
    func showDhakaLocations() {
        for location in dhakaLocations {
            let markerView = Bundle.main.loadNibNamed("CustomMarker", owner: nil, options: nil)![0] as! CustomMarker
            
            markerView.placeName.text = location["name"] as? String

            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: location["lat"] as! CLLocationDegrees, longitude: location["long"] as! CLLocationDegrees)
            marker.iconView = markerView
            marker.map = gooleMapView
        }
    }


}

