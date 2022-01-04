//
//  MapController.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 31/12/2021.
//

import UIKit
import GoogleMaps

class MapController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("AIzaSyAcYMVqKEiD08oBkXq-EBvmxR4YZFxdd0w")
           // Do any additional setup after loading the view.
                    // Create a GMSCameraPosition that tells the map to display the
                    // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 36.862499, longitude: 10.195556, zoom: 12.0)
                    let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
                    self.view.addSubview(mapView)

                    // Creates a marker in the center of the map.
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
                    marker.title = "tunis"
                    marker.snippet = "tunis"
                    marker.map = mapView
        
        //
         let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 36.869643, longitude: 10.175417)
                           marker1.title = "Player1"
                           marker1.snippet = "Tunisia"
                           marker1.map = mapView
        
        
          //
               let marker2 = GMSMarker()
              marker2.position = CLLocationCoordinate2D(latitude: 36.872731, longitude: 10.129683)
                                 marker2.title = "Player2"
                                 marker2.snippet = "Tunisia"
                                 marker2.map = mapView
        
         //
                      let marker3 = GMSMarker()
                     marker3.position = CLLocationCoordinate2D(latitude: 36.567912, longitude: 10.182898)
                                        marker3.title = "Player3"
                                        marker3.snippet = "Tunisia"
                                        marker3.map = mapView
        
         //
                             let marker4 = GMSMarker()
                            marker4.position = CLLocationCoordinate2D(latitude: 36.863912, longitude: 10.182898)
                            marker4.title = "Player4"
                            marker4.snippet = "Tunisia"
                           marker4.map = mapView
        
        
                        let marker5 = GMSMarker()
                         marker5.position = CLLocationCoordinate2D(latitude: 36.865912, longitude: 10.082898)
                          marker5.title = "Player5"
                          marker5.snippet = "Tunisia"
                          marker5.map = mapView
        
                         let marker6 = GMSMarker()
                          marker6.position = CLLocationCoordinate2D(latitude: 36.863912, longitude: 10.182898)
                          marker6.title = "Player6"
                          marker6.snippet = "Tunisia"
                          marker6.map = mapView
        
                            
                          let marker7 = GMSMarker()
                           marker7.position = CLLocationCoordinate2D(latitude: 36.867912, longitude: 10.142898)
                           marker7.title = "Player7"
                           marker7.snippet = "Tunisia"
                           marker7.map = mapView


                        let marker8 = GMSMarker()
                           marker8.position = CLLocationCoordinate2D(latitude: 36.865912, longitude: 10.187898)
                           marker8.title = "Player8"
                           marker8.snippet = "Tunisia"
                           marker8.map = mapView


        
        
    }

    
       

}
