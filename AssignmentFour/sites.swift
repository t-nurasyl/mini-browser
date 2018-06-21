//
//  sites.swift
//  AssignmentFour
//
//  Created by Toleukadyr Nurasyl on 2/21/18.
//  Copyright © 2018 Toleukadyr Nurasyl. All rights reserved.
//

import Foundation
import UIKit
class sites {
    private var description : String?
    private var url : String?
    private var isFavour : Bool?
    init(_ description: String, _ url: String,_ isFavour: Bool) {
        self.description = description
        self.url = url
        self.isFavour = isFavour
    }
    var getUrl : String? {
        get{
            return url
        }
    }
    var getName : String? {
        get{
            return description
        }
    }
    var getIsFavour: Bool? {
        get{
            return isFavour
        }
        set(value){
            isFavour = value
        }
    }
}
