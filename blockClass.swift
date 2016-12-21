//
//  blockClass.swift
//  NewsScroll
//
//  Created by xbo on 2016/12/14.
//  Copyright © 2016年 com.kemasoft.www. All rights reserved.
//

import UIKit
typealias testblock = (_ blockArry:NSArray) -> ()
class blockClass: NSObject {
 class func passValue(_ block:testblock) -> Void {
        let arry:NSArray = ["1","2"]
        
        block(arry)
        
        
        
        
    }

}
