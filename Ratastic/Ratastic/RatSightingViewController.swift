//
//  RatSightingViewController.swift
//  Ratastic
//
//  Created by Colby Tobin on 11/1/17.
//  Copyright © 2017 Team Raid. All rights reserved.
//

import UIKit

class RatSightingViewController: ViewController {

    @IBOutlet weak var lngLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var borough: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var locationType: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    @IBOutlet weak var uidLabel: UILabel!
    var ratSighting: RatSighting!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lngLabel.text = "Longitude: \(ratSighting.location.lng)"
        latLabel.text = "Latitude: \(ratSighting.location.lat)"
        borough.text = "Borough: \(ratSighting.location.borough)"
        cityLabel.text = "City: \(ratSighting.location.city)"
        addressLabel.text = "Address: \(ratSighting.location.incidentAddress)"
        zipLabel.text = "Zip: \(ratSighting.location.incidentZip)"
        locationType.text = "Location Type: \(ratSighting.location.locationType)"
        createdDateLabel.text = "Date: \(ratSighting.createdDate)"
        uidLabel.text = "UID: \(ratSighting.UID)"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
