//
//  MapViewController.swift
//  JusticeAppp
//
//  Created by Ivan Karpets on 6/9/19.
//  Copyright © 2019 Ivan Karpets. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
  
    let mapView = MKMapView()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        
        
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 25
        let mapWidth:CGFloat = view.frame.size.width-20
        let mapHeight:CGFloat = 600
        
        
       
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        mapView.delegate = self
        mapView.showsUserLocation = true
        view.addSubview(mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 50.450100, longitude: 30.523399)
        mapView.addAnnotation(annotation)
        mapView.isZoomEnabled = true
       
    
    }
    private func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        
        // get the particular pin that was tapped
        let pinToZoomOn = view.annotation
        
        // optionally you can set your own boundaries of the zoom
        let span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        
        // or use the current map zoom and just center the map
        // let span = mapView.region.span
        
        // now move the map
        let region = MKCoordinateRegion(center: pinToZoomOn!.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }


}


