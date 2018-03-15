//
//  dbObjects.swift
//  oscarWinners
//
//  Created by Baldus,Cassandra R on 3/15/18.
//  Copyright © 2018 Northwest. All rights reserved.
//

import Foundation
import Parse
class Movie:PFObject, PFSubclassing {
    
    @NSManaged var title:String
    @NSManaged var year:Int
    @NSManaged var director:String
    
    static func parseClassName() -> String {
        return "Movie"
    }
    
}
