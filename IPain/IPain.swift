//
//  IPain.swift
//  IPain
//
//  Created by Darren Jr Baldwin  on 10/14/20.
//  Copyright © 2020 Darren Baldwin Jr. All rights reserved.
//

import WidgetKit
import SwiftUI


// User Defaults keys
struct DKeys {
    static let Userpain = "userpain"
    static let UserPainOnly = "ONLYPAIN"
    static let UserCauseOnly = "ONLYCAUSE"
    
}

// User defaults access
let Defaults = UserDefaults.standard


struct IpainEntry : TimelineEntry {
    var date: Date
    
    let painOnly = Defaults.value(forKey: DKeys.UserPainOnly) as? String ?? ""
}



struct IPainWidgetView: View {
    
    
    
    
    var body: some View {
        Text()
    }
    

}





