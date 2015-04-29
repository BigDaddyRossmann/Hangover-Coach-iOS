//
//  SymptomsViewController.swift
//  Hangover Coach
//
//  Created by Joshua Archer on 4/27/15.
//  Copyright (c) 2015 Big Daddy Rossmann. All rights reserved.
//

import UIKit


class SymptomsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var symptomTableView: UITableView!
  
  let symptoms: [String] = ["Headache", "Vomiting", "Nausea", "Muscle Pain", "Weakness", "Dizziness", "Light Sensitivity"]
  var selectedCells = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    symptomTableView!.delegate = self
    symptomTableView!.dataSource = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - UITableView Delegate Methods
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return symptoms.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = symptomTableView.dequeueReusableCellWithIdentifier("SymptomCell") as! UITableViewCell
    cell.textLabel?.text = symptoms[indexPath.row]
    
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    var cell: UITableViewCell = symptomTableView.cellForRowAtIndexPath(indexPath)!
    var symptom = cell.textLabel?.text
    
    if (cell.accessoryType == UITableViewCellAccessoryType.Checkmark) {
      cell.accessoryType = UITableViewCellAccessoryType.None
      for (index, value) in enumerate(selectedCells) {
        if selectedCells[index] == symptom {
          selectedCells.removeAtIndex(index)
          break
        }
      }
    } else {
      cell.accessoryType = UITableViewCellAccessoryType.Checkmark
      self.selectedCells.append(symptom!)
    }
    
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  // MARK: - Navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let dvc = segue.destinationViewController as! DetailViewController
    dvc.selections = selectedCells
  }
}
