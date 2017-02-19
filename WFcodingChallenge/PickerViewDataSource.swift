//
//  PickerViewDataSource.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/17/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class PickerViewDataSource: NSObject, UIPickerViewDataSource {

    private let pickerDataSource = PickerModel()
    
    // number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        
        return pickerDataSource.getPickerData().count
    }
    
    
    
}
