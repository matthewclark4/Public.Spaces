//
//  MapViewController.swift
//  PublicSpaces
//
//  Created by Matthew Clark on 09/04/2020.
//  Copyright © 2020 Matthew Clark. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - iVars
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var alert: UIAlertController!
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = 50

        checkCLLocationPermission()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    // MARK: - Map Helper Methods
    
    private func checkCLLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {

            switch CLLocationManager.authorizationStatus() {
            case .restricted, .denied:
                self.showLocationPermissionAlert()
            case .notDetermined:
                self.locationManager.requestWhenInUseAuthorization()
            case .authorizedAlways, .authorizedWhenInUse:
                self.locationManager.startUpdatingLocation()
                break
            @unknown default:
                fatalError()
            }
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    private func showLocationPermissionAlert() {
        self.alert = UIAlertController (title: NSLocalizedString("Location Alert Title", comment: ""), message: NSLocalizedString("Location Alert Message", comment: ""), preferredStyle: .alert)

        let settingsAction = UIAlertAction(title: NSLocalizedString("Settings", comment: ""), style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }

            if UIApplication.shared.canOpenURL(settingsUrl) {

                UIApplication.shared.open(settingsUrl, completionHandler: { (_ success) in
                })
            }
        }
        self.alert.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default, handler: { (_ action: UIAlertAction!) in
        })
        self.alert.addAction(cancelAction)

        self.present(alert, animated: true, completion: nil)
    }
    
    func setupMapViewZoom() {
        let center = CLLocationCoordinate2D(latitude: self.locationManager.location?.coordinate.latitude ?? 51.5074, longitude: self.locationManager.location?.coordinate.longitude ?? 0.1278)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
        self.mapView.setRegion(region, animated: true)
    }
}

// MARK: -CLLocationManagerDelegate

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.last else {
            return
        }

        self.currentLocation = location

        updateLocation(currentLocation: location)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {

        updateLocationDidFailWithError(error: error)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkCLLocationPermission()
    }
    
    // Private function
    private func updateLocation(currentLocation: CLLocation) {

        self.currentLocation = currentLocation
        
        let center = CLLocationCoordinate2D(latitude: self.currentLocation?.coordinate.latitude ?? 55.5074, longitude: self.currentLocation?.coordinate.longitude ?? 0.1278)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
        self.mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
        
        self.locationManager.stopUpdatingLocation()
    }

    private func updateLocationDidFailWithError(error: Error) {

        startMapAtPredefinedLocation()
    }
    
    private func startMapAtPredefinedLocation() {
        let center = CLLocationCoordinate2D(latitude: 55.5074, longitude: 0.1278)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
        self.mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
    }
}
