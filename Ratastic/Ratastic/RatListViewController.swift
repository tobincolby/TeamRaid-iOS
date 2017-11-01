//
//  RatListViewController.swift
//  Ratastic
//
//  Created by Colby Tobin on 11/1/17.
//  Copyright © 2017 Team Raid. All rights reserved.
//

import UIKit

class RatListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listView: UITableView!
    
    var chosenRatSighting: RatSighting?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if (!UserDefaults.standard.bool(forKey: "loadedData")){
            self.readDataFromCSV()
        } else {
            self.loadFromDefaults()
        }
        listView.dataSource = self
        listView.delegate = self
        listView.reloadData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logout(_ sender: Any) {
        self.performSegue(withIdentifier: "logout", sender: self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenRatSighting = RatSighting.ratSightingArray.object(at: indexPath.row) as? RatSighting
        self.performSegue(withIdentifier: "specificSighting", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? RatSightingViewController  {
            if let ratSighting = chosenRatSighting {
                vc.ratSighting = ratSighting
            }
        } else {
            User.currentUser = nil
        }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return chosenRatSighting != nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RatSighting.ratSightingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "Sighting At \((RatSighting.ratSightingArray.object(at: indexPath.row) as! RatSighting).location.city)"
        return cell
        
    }
    
    func loadFromDefaults() {
        guard let ratSightings = NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.value(forKey: "ratSightings") as! Data) as? NSMutableArray else {
            UserDefaults.standard.set(false, forKey: "loadedData")
            return
        }
        RatSighting.ratSightingArray = ratSightings
    }
    
    func readDataFromCSV() {
        let csvPath = Bundle.main.path(forResource: "Rat_Sightings", ofType: "csv")
        
        if csvPath == nil {
            return
        }
        
        var csvData: String? = nil
        
        do {
            csvData = try String(contentsOfFile: csvPath!, encoding: String.Encoding.utf8)
            let csv = csvData?.csvRows()
            for row in csv! {
                let UID = row[0]
                if UID == "Unique Key" {
                    continue
                }
                let date = row[1]
                let locType = row[7]
                let incZip = row[8]
                let incAdd = row[9]
                let city = row[16]
                let borough = row[23]
                let lat = Float(row[49])
                let lng = Float(row[50])
                
                let location = Location(locationType: locType, incidentZip: incZip, incidentAddress: incAdd, city: city, borough: borough, lat: lat!, lng: lng!)
                
                let ratSighting = RatSighting(UID: UID, createdDate: date, location: location)
                RatSighting.ratSightingArray.add(ratSighting)
                
            }
            
        } catch{
            print(error)
        }
        
        UserDefaults.standard.set(true, forKey: "loadedData")
        let data = NSKeyedArchiver.archivedData(withRootObject: RatSighting.ratSightingArray)
        UserDefaults.standard.set(data, forKey: "ratSightings")
        
    }
    

    

}
