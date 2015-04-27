//
//  SymptomsViewController.swift
//  Hangover Coach
//
//  Created by Joshua Archer on 4/27/15.
//  Copyright (c) 2015 Big Daddy Rossmann. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
        @IBOutlet weak var symptomTableView: UITableView!
        
        let symptoms: [String] = ["Headach", "Vomiting", "Nausea", "Muscle Pain", "Weakness", "Dizziness", "Light Sensitivity"]
        var selectedCells = [String]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            
            symptomTableView!.delegate = self
            symptomTableView!.dataSource = self
            
            
            
            // Do any additional setup after loading the view.
        }
        
        @IBAction func askCoachTapped(sender: AnyObject) {
            println("Ask The Coach... Cure hangover")
            
        }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return symptoms.count
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = symptomTableView.dequeueReusableCellWithIdentifier("SymptomCell") as! SymptomTableViewCell
            
            cell.symptomLabel.text = symptoms[indexPath.row]
            
            return cell
        }
        
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            var cell: SymptomTableViewCell = symptomTableView.cellForRowAtIndexPath(indexPath) as! SymptomTableViewCell
            var symptom = cell.symptomLabel.text
            
            if (cell.accessoryType == UITableViewCellAccessoryType.Checkmark) {
                cell.accessoryType = UITableViewCellAccessoryType.None
            }
            else {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                self.selectedCells.append(symptom!)
            }
        }
        
        func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
            var cell: SymptomTableViewCell = tableView.cellForRowAtIndexPath(indexPath) as! SymptomTableViewCell
            var symptom = cell.symptomLabel.text
            
            if (cell.accessoryType == UITableViewCellAccessoryType.Checkmark) {
                cell.accessoryType = UITableViewCellAccessoryType.None
                for (index, value) in enumerate(selectedCells) {
                    if selectedCells[index] == symptom {
                        selectedCells.removeAtIndex(index)
                        break
                    }
                }
            }
            else {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
            
        }
        
        
        
        
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
            
            // Soooo pass the strings from [selectedCells] as unique symptoms names to query the next view controller
            
            
        }
        
        
}