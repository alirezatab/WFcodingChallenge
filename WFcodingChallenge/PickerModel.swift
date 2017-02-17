//
//  PickerModel.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/17/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class PickerModel: NSObject {
    
    private var pickerData : [String] = []
    
    override init() {
        super.init()
        
        setPickerData()
    }
    
    private func setPickerData() {
        for i in 1...12 {
            pickerData.append(String(i))
        }
        print(pickerData.count)
    }
    
    func getPickerData() -> [String] {
        return pickerData
    }
    
}
