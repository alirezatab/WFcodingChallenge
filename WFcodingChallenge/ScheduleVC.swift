//
//  ScheduleVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class ScheduleVC: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerHelperView: UIView!
    @IBOutlet weak var pickerViewToolbar: UIToolbar!
    @IBOutlet weak var reservationButton: UIButton!
    
    //MARK: - Global Private constants
    fileprivate var partySizeString = String()
    fileprivate let pickerData = PickerModel().getPickerData()
    private let pickerDataSoure = PickerViewDataSource()
    private let segueIdentifierMassageOptionVC = "MassageOptionVC"
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set PickerView DataSource to Model DataSource
        pickerView.dataSource = pickerDataSoure
        
        configurePickerView()
        
        // hide helper view will hide toolbar and pickerView subviews
        pickerHelperView.isHidden = true
        
        reservationButton.isEnabled = false
    }
    
    // MARK: - Custom Configuration Method
    func configurePickerView() {
        pickerView.backgroundColor = .white
        pickerView.showsSelectionIndicator = true
        pickerView.delegate = self
    }
    
    // MARK: - IBActions
    @IBAction func onDoneButtonPressed(_ sender: UIBarButtonItem) {
        pickerHelperView.isHidden = true
        
        let partSizeDict : [String: String] = ["partySize": partySizeString]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SetPartSizeLabel"), object: self, userInfo: partSizeDict)
    }
    
    @IBAction func onCancelButtonPressed(_ sender: UIBarButtonItem) {
        pickerHelperView.isHidden = true
    }
    
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifierMassageOptionVC {
            let massageOptionVC = segue.destination as! MassageOptionVC
            massageOptionVC.pickerViewCustomDelegate = self
        }
    }

}

// MARK: - Picker View Delegate
extension ScheduleVC : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40.0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        partySizeString = pickerData[row]
    }
}

// mark: - Picker View Custom Delegate
extension ScheduleVC : PickerViewCustomDelegate {
    func showPickerView() {
            pickerHelperView.isHidden = false
    }
}
