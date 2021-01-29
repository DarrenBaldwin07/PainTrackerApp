//
//  PainHistoryViewController.swift
//  Adyptaion - Pain tracker
//
//  Created by Darren Jr Baldwin  on 8/22/20.
//  Copyright © 2020 Darren Baldwin Jr. All rights reserved.
//

import UIKit

class PainHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    
    
    
    
    

    let Defaults = UserDefaults.standard
    var PainData = [String]()
    
    // outlets
    @IBOutlet weak var YourDataView: UIView!
    
    
    @IBOutlet weak var PainTableView: UITableView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StyleYourDataView()
        StylePainTableView() 
        //DisplayPainHistory()\
        
        PainTableView.delegate = self
        PainTableView.dataSource = self
    }
    
    
    // changes background color of pain tableview
    func StylePainTableView() {
        self.PainTableView.layer.backgroundColor = UIColor.white.cgColor
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        PainTableView.reloadData()
        
    }
    
    func StyleYourDataView() {
        self.YourDataView.layer.cornerRadius = 25
        self.YourDataView.layer.shadowColor = UIColor.lightGray.cgColor
        self.YourDataView.layer.shadowRadius = 1
        self.YourDataView.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.YourDataView.layer.shadowOpacity = 285
    }
    
    
  
    
    // adds data to table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let Pain = PainList {
            return Pain.count
        } else {
            return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PainCell", for: indexPath) as! TableViewCell
        
        if let Pain = PainList {
            cell.PainLabelCell?.text = Pain[indexPath.row]
        }
        
        
        return cell
    }
       
    


}


