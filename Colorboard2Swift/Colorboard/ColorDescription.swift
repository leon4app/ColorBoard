//
//  ColorDescription.swift
//  Colorboard
//
//  Created by LeonTse on 2017/4/5.
//  Copyright © 2017年 LeonTse. All rights reserved.
//

import Foundation
import UIKit
open class ColorDescription : NSObject
{
    open var color: UIColor!
    
    open var name: String!
    
    override public init()
    {
        color = UIColor.init(red: 0, green: 0, blue: 1, alpha: 1)
        name = "Blue"
    }
}
