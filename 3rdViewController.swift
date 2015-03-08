//
//  3rdViewController.swift
//  Forget Me Not
//
//  Created by Anusha Chillara on 1/8/15.
//  Copyright (c) 2015 Chillara. All rights reserved.
//


    import Foundation
    import UIKit
    import MapKit
    import CoreLocation
    
    
    class _rdViewController: UIViewController,  MKMapViewDelegate, CLLocationManagerDelegate {
        
        
        @IBOutlet var mapView: MKMapView!
        var manager = CLLocationManager()
        
        override func viewDidLoad() {
            //Core Location
            super.viewDidLoad()
            manager.delegate=self
            manager.requestWhenInUseAuthorization()
            manager.desiredAccuracy=kCLLocationAccuracyBest
            manager.startUpdatingLocation()
            // Do any additional setup after loading the view.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
         override func viewWillAppear(animated: Bool) {
            mapView.showsUserLocation=true
        }
        
        func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
            var userLocation:CLLocation=locations[0] as CLLocation
            var latitude:CLLocationDegrees = userLocation.coordinate.latitude
            var longitude:CLLocationDegrees = userLocation.coordinate.longitude
            println(userLocation.coordinate.latitude)
            println(userLocation.coordinate.longitude)
            var latDelta:CLLocationDegrees = 0.01
            var lonDelta:CLLocationDegrees = 0.01
            var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta,lonDelta)
            var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            var region:MKCoordinateRegion = MKCoordinateRegionMake(location,span)
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation=true
            var uilpgr=UILongPressGestureRecognizer(target: self, action:"action:")
            uilpgr.minimumPressDuration=2.0
            mapView.addGestureRecognizer(uilpgr)
            
        }
        
        
        func action(gestureRecognizer:UIGestureRecognizer){
            var touchpoint=gestureRecognizer.locationInView(self.mapView)
            var newCoordinate:CLLocationCoordinate2D = mapView.convertPoint(touchpoint, toCoordinateFromView: self.mapView)
            var annotation=MKPointAnnotation()
            annotation.coordinate=newCoordinate
            annotation.title="New Point"
            mapView.addAnnotation(annotation)
            
            
        }
        // @IBAction func deleteAnnotation(sender: AnyObject,annotation:MKPointAnnotation) {
        
        //   mapView.removeAnnotation (annotation)
        // }
        
        func saveRegion(newCoordinate:CLLocationCoordinate2D)
        {
            var region=CLCircularRegion(center: newCoordinate, radius: 30, identifier: "home")
            NSUserDefaults.standardUserDefaults().setObject(region, forKey: "home")
            NSUserDefaults.standardUserDefaults().synchronize()
            println(region.description)
            manager.startMonitoringForRegion(region)
        }
        
        func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
            println("cool")
            //notification
        }
        
        func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
            println(error)
        }
        
        


        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


