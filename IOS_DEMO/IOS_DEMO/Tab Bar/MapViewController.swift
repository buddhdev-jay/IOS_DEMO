//
//  MapViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 08/03/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var MapView: MKMapView!
    
    // MARK: - variables
    var city = ["select City","Ahmedabad","Rajkot"]
    var annotation = MKPointAnnotation()
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
}
// MARK: - updateMap
extension MapViewController{
    func updateMap(row : Int,latitude:Double,longitude:Double)
    {
        let location = CLLocationCoordinate2D(latitude: latitude,longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta:1)
        let region = MKCoordinateRegion(center: location, span: span)
        MapView.removeAnnotation(annotation)
        MapView.setRegion(region, animated: true)
        annotation.coordinate = location
        MapView.addAnnotation(annotation)
    }
}
// MARK: - UIPickerViewDataSource
extension MapViewController:UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return city.count
    }
}
// MARK: - UIPickerViewDelegate
extension MapViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return city[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 1: updateMap(row: row,latitude: 23.0225,longitude: 72.5714)
        case 2: updateMap(row: row,latitude: 22.3039,longitude: 70.8022)
        default: updateMap(row: row,latitude: 23.0225,longitude: 72.5714)
        }
        
    }
}
