//
//  ScheduleVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit
import CoreData

class ScheduleVC: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerHelperView: UIView!
    @IBOutlet weak var pickerViewToolbar: UIToolbar!
    @IBOutlet weak var reservationButton: UIButton!
    
    //MARK: - Global Private constants
    fileprivate let pickerData = PickerModel().getPickerData()
    fileprivate var partySizeString = String()
    fileprivate var isDateSelected = Bool()
    fileprivate var isTimeSelected = Bool()
    fileprivate var selectedTime = String()
    fileprivate var selectedWeekday = String()
    fileprivate var selectedDayOfMonthNumber = String()
    fileprivate var currentMonth = String()
    private var dateFormatter = DateFormatter()
    private var myReservationsClassName = String()
    private let pickerDataSoure = PickerViewDataSource()
    private let massageOptionVCidentifier = "MassageOptionVC"
    private let dateCollectionVCidentifier = "DateCollectionVC"
    private let timeCollectionVCidentifier = "TimeCollectionVC"
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        partySizeString = "1"
        
        myReservationsClassName = String(describing: MyReservations.self)
        
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
    
    func shouldEnableReservationButton() {
        //print(isTimeSelected)
        //print(isDateSelected)
        if isTimeSelected && isDateSelected {
            reservationButton.isEnabled = true
            reservationButton.backgroundColor = UIColor(colorLiteralRed: 2/255.0,
                                                        green: 107/255.0,
                                                        blue: 197/255.0,
                                                        alpha: 1.0)
        } else {
            reservationButton.isEnabled = false
            reservationButton.backgroundColor = UIColor(colorLiteralRed: 130/255.0,
                                                        green: 177/255.0,
                                                        blue: 222/255.0,
                                                        alpha: 1.0)
        }
    }
    
    func getYear() -> String {
        let currentDate = NSDate()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: currentDate as Date)
    }
    
    // save to coreData when reservation button is pressed
    @IBAction func onReservationButtonPressed(_ sender: UIButton) {
        let myReservation : MyReservations = NSEntityDescription.insertNewObject(forEntityName: myReservationsClassName,
                                                                                 into: CoreDataStack.getContext()) as! MyReservations
        
        myReservation.partySize = self.partySizeString
        myReservation.reservationDate = "\(self.currentMonth) \(self.selectedDayOfMonthNumber), \(getYear())"
        myReservation.reservationDay = "\(self.selectedWeekday)"
        myReservation.reservationTime = self.selectedTime
        
        CoreDataStack.saveContext()
    }
    
    // MARK: - IBActions
    @IBAction func onDoneButtonPressed(_ sender: UIBarButtonItem) {
        pickerHelperView.isHidden = true
        
        let partSizeDict : [String: String] = ["partySize": partySizeString]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SetPartySizeLabel"),
                                        object: self,
                                        userInfo: partSizeDict)
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
        if segue.identifier == massageOptionVCidentifier
        {
            let massageOptionVC = segue.destination as! MassageOptionVC
            massageOptionVC.pickerViewCustomDelegate = self
        }
        else if segue.identifier == dateCollectionVCidentifier
        {
            let dateCollectionVC = segue.destination as! DateCollectionVC
            dateCollectionVC.dateSelectionDelegate = self
        }
        else if segue.identifier == timeCollectionVCidentifier
        {
            let timeCollectionVC = segue.destination as! TimeCollectionVC
            timeCollectionVC.timeSelectionDelegate = self
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

// mark: - Date Selection Custom Delegate
extension ScheduleVC : DateSelectionDelegate {
    func isDateSelected(_ isSelected: Bool, weekday: String, dayOfMonthNumber: String, currentMonth: String) {
        self.isDateSelected = isSelected
        self.selectedWeekday = weekday;
        self.selectedDayOfMonthNumber = dayOfMonthNumber
        self.currentMonth = currentMonth
        
        shouldEnableReservationButton()
    }
}

// mark: - Time Selection Custom Delegate
extension ScheduleVC : TimeSelectionDelegate {
    func isTimeSelected(_ isSelected: Bool, selectedTime: String) {
        self.isTimeSelected = isSelected
        self.selectedTime = selectedTime
        
        print(isTimeSelected)
        shouldEnableReservationButton()
    }
}
