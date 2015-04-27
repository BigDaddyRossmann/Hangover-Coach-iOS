//
//  DetailViewController.swift
//  Hangover Coach
//
//  Created by David Chavez on 4/27/15.
//  Copyright (c) 2015 Big Daddy Rossmann. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var scrollPager: ScrollPager!
  
  var selections = [String]()
  var views: [(String, UITableView)] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print(selections)
    
    // Do any additional setup after loading the view.
    for symptom in selections {
      views.append((symptom, UITableView()))
    }
    
    scrollPager.addSegmentsWithTitlesAndViews(views)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - UITableView Delegate Methods
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("contentCell", forIndexPath: indexPath) as! UITableViewCell
    
    return cell
  }
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
}