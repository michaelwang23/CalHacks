//
//  LocationController.swift
//  project
//
//  Created by Michael Wang on 10/27/19.
//  Copyright © 2019 Michael Wang. All rights reserved.
//

import UIKit
import Foundation

class LocationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://api.mapbox.com/geocoding/v5/mapbox.places/2700%20Hearst%20Avenue.json?access_token=pk.eyJ1IjoibWljaGFlbHdhbmc2NCIsImEiOiJjazI4b3R0ZDEwMnd5M2NvMXQ2ZmFxcmhzIn0.h44WHKxJNvZWOni2ZfNkAA&limit=1")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                   let search_string = dataString
                    let pattern = #"[0-9+],[0-9+]"#
                    let regex = try NSRegularExpression(pattern: pattern, options: [])
                    print(regex)
                    return dataString
                }
            }
        }
        task.resume()


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


