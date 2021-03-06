//
//  ScheduleVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 10.0, *)
class ScheduleVC: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerHelperView: UIView!
    @IBOutlet weak var pickerViewToolbar: UIToolbar!
    @IBOutlet weak var reservationButton: UIButton!
    
    //MARK: - Global fileprivate constants & Variables
    fileprivate let pickerData = PickerModel().getPickerData()
    fileprivate var partySizeString = String()
    fileprivate var selectedTime = String()
    fileprivate var selectedWeekday = String()
    fileprivate var selectedDayOfMonthNumber = String()
    fileprivate var currentMonth = String()
    fileprivate var selectedDateIndexPath = IndexPath()
    fileprivate var selectedTimeIndexPath = IndexPath()
    fileprivate let presistTimeSelected = "timeSelected"
    fileprivate let presistDateSelected = "dateSelected"
    fileprivate var defaults = UserDefaults.standard
    
    //MARK: - Global Private constants & Variables
    private let pickerDataSoure = PickerViewDataSource()
    private let massageOptionVCidentifier = "MassageOptionVC"
    private let dateCollectionVCidentifier = "DateCollectionVC"
    private let timeCollectionVCidentifier = "TimeCollectionVC"
    
    private var dateFormatter = DateFormatter()
    private var myReservationsClassName = String()
    
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
        
        shouldEnableReservationButton()
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
        
        // for presistant data, dave the state of enabled button and use it to bypass if statement
        let isTimeSelected = defaults.bool(forKey: presistTimeSelected)
        let isDateSelected = defaults.bool(forKey: presistDateSelected)
        
        if isTimeSelected && isDateSelected {
            reservationButton.isEnabled = true
            reservationButton.backgroundColor = UIColor(colorLiteralRed: 2/255.0,
                                                        green: 107/255.0,
                                                        blue: 197/255.0,
                                                        alpha: 1.0)
        }
        else
        {
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
        myReservation.reservationDate = "\(self.selectedWeekday), \(self.currentMonth) \(self.selectedDayOfMonthNumber), \(getYear())"
        myReservation.reservationDay = "\(self.selectedWeekday)"
        myReservation.reservationTime = self.selectedTime
        
        CoreDataStack.saveContext()
        // when user pushes the reserved button, reset the userdefault for Date and Time selection
        defaults.set(false, forKey: "Date - \(self.selectedDateIndexPath.item)")
        defaults.set(false, forKey: "Time - \(self.selectedTimeIndexPath.item)")
        defaults.set(false, forKey: presistTimeSelected)
        defaults.set(false, forKey: presistDateSelected)
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
@available(iOS 10.0, *)
extension ScheduleVC : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    rowHeightForComponent component: Int) -> CGFloat {
        
        return 40.0
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        partySizeString = pickerData[row]
    }
}

//MARK: - Picker View Custom Delegate
@available(iOS 10.0, *)
extension ScheduleVC : PickerViewCustomDelegate {
    func showPickerView() {
        pickerHelperView.isHidden = false
    }
}

//MARK: - Date Selection Custom Delegate
@available(iOS 10.0, *)
extension ScheduleVC : DateSelectionDelegate {
    func isDateSelected(_ isSelected: Bool,
                        weekday: String,
                        dayOfMonthNumber: String,
                        currentMonth: String,
                        indexPath: IndexPath) {
        
        self.selectedWeekday = weekday;
        self.selectedDayOfMonthNumber = dayOfMonthNumber
        self.currentMonth = currentMonth
        self.selectedDateIndexPath = indexPath
        
        defaults.set(false, forKey: presistDateSelected)
        
        if isSelected {
            defaults.set(true, forKey: presistDateSelected)
        }
        
        shouldEnableReservationButton()
    }
}

//MARK: - Time Selection Custom Delegate
@available(iOS 10.0, *)
extension ScheduleVC : TimeSelectionDelegate {
    func isTimeSelected(_ isSelected: Bool,
                        selectedTime: String,
                        indexPath: IndexPath) {
        
        self.selectedTime = selectedTime
        self.selectedTimeIndexPath = indexPath
        defaults.set(false, forKey: presistTimeSelected)
        
        if isSelected {
            defaults.set(true, forKey: presistTimeSelected)
        }
        
        shouldEnableReservationButton()
    }
}
