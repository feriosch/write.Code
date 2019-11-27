//
//  MapaDesafioViewController.swift
//  write.Code
//
//  Created by cdt307 on 10/10/19.
//  Copyright © 2019 FernandoRios. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapaDesafioViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
    private let locationManager = CLLocationManager()
    
    @IBAction func menuButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    private var allAnnotations: [MKAnnotation]?
    
    private var displayedAnnotations: [MKAnnotation]? {
        willSet {
            if let currentAnnotations = displayedAnnotations {
                mapa.removeAnnotations(currentAnnotations)
            }
        }
        didSet {
            if let newAnnotations = displayedAnnotations {
                mapa.addAnnotations(newAnnotations)
            }
            centerMapOnCDMX()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        mapa.mapType = MKMapType.standard
        

        
        mapa.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(DesafioAnnotation.self))
        
        allAnnotations = [DesafioAnnotation()]
        showAllAnnotations(self)
        

        mapa.showsCompass = true
        mapa.showsScale = true
        mapa.isZoomEnabled = true
    }
    
    private func centerMapOnCDMX() {
        let cl = CLLocationCoordinate2DMake(19.305_765, -99.205_030)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        mapa.setRegion(MKCoordinateRegion(center: cl, span: span), animated: true)
    }
    
    @IBAction private func showAllAnnotations(_ sender: Any) {
        // User tapped "All" button in the bottom toolbar
        displayedAnnotations = allAnnotations
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
            mapa.showsUserLocation = true
        } else {
            locationManager.stopUpdatingLocation()
            mapa.showsUserLocation = false
        }
    }

    
}

extension MapaDesafioViewController: MKMapViewDelegate {
    
    /// The map view asks `mapView(_:viewFor:)` for an appropiate annotation view for a specific annotation.
    /// - Tag: CreateAnnotationViews
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            // Make a fast exit if the annotation is the `MKUserLocation`, as it's not an annotation view we wish to customize.
            return nil
        }
        
        var annotationView: MKAnnotationView?
        
        if let annotation = annotation as? DesafioAnnotation {
            annotationView = setupFerryBuildingAnnotationView(for: annotation, on: mapView)
        }
        
        return annotationView
    }
    
    /// Create an annotation view for the Ferry Building, and add an image to the callout.
    /// - Tag: CalloutImage
    private func setupFerryBuildingAnnotationView(for annotation: DesafioAnnotation, on mapView: MKMapView) -> MKAnnotationView {
        let identifier = NSStringFromClass(DesafioAnnotation.self)
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier, for: annotation)
        if let markerAnnotationView = view as? MKMarkerAnnotationView {
            markerAnnotationView.animatesWhenAdded = true
            markerAnnotationView.canShowCallout = true
            markerAnnotationView.markerTintColor = UIColor.purple
            
            // Provide an image view to use as the accessory view's detail view.
            markerAnnotationView.detailCalloutAccessoryView = UIImageView(image: #imageLiteral(resourceName: "Jack"))
        }
        
        return view
    }
}


