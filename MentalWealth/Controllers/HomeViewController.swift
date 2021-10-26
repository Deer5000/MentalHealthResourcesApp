//
//  MainViewController.swift
//  MentalWealth
//
//  Created by Khidr Brinkley on 9/28/21.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var resources: [String] = []
    
//    let lat: MapKit.latitude = selectedlocation.latitude
//    let lon = MapKit.longitude = selectedLocation.longitude

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapTypeSegmentControl: UISegmentedControl!
    @IBOutlet weak var AnnotationTableView: UITableView!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        
        //Current location
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 5
        locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
        self.mapTypeSegmentControl.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)
        
    }
    
    
    @objc func mapTypeChanged(segmentedControl: UISegmentedControl) {
        
        switch(segmentedControl.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = .satellite
        case 1:
            self.mapView.mapType = .standard
        default:
            self.mapView.mapType = .satellite
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {

        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        mapView.setRegion(region, animated: true)
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Mental Health Resources"
        request.region = region
        let search = MKLocalSearch(request: request)
        search.start { [self] (response, error) in
            guard let response = response else {
                return
            }
            for item in response.mapItems {
                let annotation = MKPointAnnotation()
                annotation.coordinate = item.placemark.coordinate
                annotation.title = item.name
                DispatchQueue.main.async {
                self.mapView.addAnnotation(annotation)
                }
//                resources.append(annotation.title!)
//                print(resources)
            }
        }
    }
}
    
//class AnnotationTableView: UITableViewController {
//    let vc = HomeViewController()
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return vc.resources.count
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath as IndexPath)
//        cell.textLabel?.text = vc.resources[indexPath.item]
//        return cell
//    }
//}
