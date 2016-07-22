//
//  Person.swift
//  NSUserDefaultsExampleApp
//
//  Created by Dino Musliu on 20/07/2016.
//  Copyright © 2016 Dino Musliu. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding { // ako zelimo pohraniti custom clase u ns, nasa klasa mora naslijediti nsobject i nscoding

    var firstName: String!
    var lastName: String!
    
    init (first: String, last: String) {
        firstName = first
        lastName = last
    }
    
    override init() {
    
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.firstName = aDecoder.decodeObjectForKey("firstName") as? String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as? String
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
         aCoder.encodeObject(self.firstName, forKey: "firstName")
         aCoder.encodeObject(self.lastName, forKey: "lastName")
    }
    

}