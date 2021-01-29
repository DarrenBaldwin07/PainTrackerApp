//
//  Constants2.swift
//  Adyptaion - Pain tracker
//
//  Created by Darren Jr Baldwin  on 8/25/20.
//  Copyright © 2020 Darren Baldwin Jr. All rights reserved.
//

import Foundation

let Defaults = UserDefaults.standard

var PainList:[String]?
var PainAverage:[Int]?
   
   
func SaveData(Pain:[String]) {
    Defaults.set(PainList, forKey: "PainList")
}

func SaveAverageData(Average:[Int]) {
    Defaults.set(PainAverage, forKey: "PainAverageList")
   
}

   
func fetchData() -> [String]? {
    if let pain = UserDefaults.standard.array(forKey: "PainList") as? [String] {
        return pain
    } else {
        return nil
    }
}

func fetchAverageData() -> [Int]? {
    if let average = UserDefaults.standard.array(forKey: "PainAverageList") as? [Int] {
        return average
    } else {
        return nil
    }
}




