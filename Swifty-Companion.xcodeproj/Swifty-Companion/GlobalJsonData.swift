//
//  GlobalJsonData.swift
//  Swifty-Companion
//
//  Created by Mashudu NEPFUMBADA on 2018/10/19.
//  Copyright © 2018 Mashudu NEPFUMBADA. All rights reserved.
//

import Foundation
import SwiftyJSON

class GlobalJsonData
{
    // These are the properties you can store in your singleton
    //private var myName: String = "bob"
    public var json: JSON?
    
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    //to call GlobalJsonData.jsonManager.json
    
    class var jsonManager: GlobalJsonData {
        struct Static {
            static let instance = GlobalJsonData()
        }
        return Static.instance
    }
}
