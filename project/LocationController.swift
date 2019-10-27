//
//  LocationController.swift
//  project
//
//  Created by Michael Wang on 10/27/19.
//  Copyright © 2019 Michael Wang. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class LocationController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var TextLabel: UILabel!
    var locationManager:CLLocationManager!
    var my_lat = 37.87
    var my_long = -122.25
    
    @IBOutlet weak var TextBox: UITextField!
    
    @IBAction func VerifyConnection(_ sender: UIButton) {
        determineMyCurrentLocation()
        var originalUrl: String = TextBox.text as! String
        var urlString: String = originalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "a"
        var uri = "https://api.mapbox.com/geocoding/v5/mapbox.places/" + urlString + ".json?access_token=pk.eyJ1IjoibWljaGFlbHdhbmc2NCIsImEiOiJjazI4b3R0ZDEwMnd5M2NvMXQ2ZmFxcmhzIn0.h44WHKxJNvZWOni2ZfNkAA&limit=1"
            
        let url = URL(string: uri)!
        
       print(url)
        Alamofire.request(url).responseJSON { response in
            if let JSON = response.result.value {
                let dictionary = JSON as! NSDictionary
                let features = dictionary["features"] as! Array<NSDictionary>
                let center = features[0]["center"] as! Array<Double>
                var desired_lat: Double = center[1]
                var desired_long: Double = center[0]
                print(JSON)
                print(abs(self.my_lat - desired_lat))
                print(abs(self.my_long - desired_long))
                if abs(self.my_lat - desired_lat) < 0.1 && abs(self.my_long - desired_long) < 0.1 {
                    self.TextLabel.text = "Success"
                }
                else {
                    self.TextLabel.text = "Too far"
                }
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //determineMyCurrentLocation()
    }
        
        func determineMyCurrentLocation() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            //if CLLocationManager.locationServicesEnabled(){
                locationManager.startUpdatingLocation()
            //}
        }
            
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let userLocation:CLLocation = locations[0] as CLLocation
            self.my_lat = userLocation.coordinate.latitude
            self.my_long = userLocation.coordinate.longitude
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
        {
            print("Error \(error)")
        }
    }
        
        
        


    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


