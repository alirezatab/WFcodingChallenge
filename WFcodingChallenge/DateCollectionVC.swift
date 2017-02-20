//
//  DateCollectionVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

// set custom delegate for date selection
protocol DateSelectionDelegate {
    func isDateSelected(_ isSelected: Bool,
                        weekday: String,
                        dayOfMonthNumber: String,
                        currentMonth: String, indexPath: IndexPath)
}

class DateCollectionVC: UIViewController, UICollectionViewDelegate {

    //MARK: - IBOutlets
    @IBOutlet weak var dateCollectionView: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    
    //MARK: - Global Private constants & Vriables
    private let currentDate = NSDate()
    private var defaults = UserDefaults.standard
    private let dataSource = DateCollectionViewDataSource()
    private var weekday = String()
    private var isSelected = false
    private var daysInMonth = Int()
    private var dateFormatter = DateFormatter()
    
    // MARK: - Golbal public delegate variable
    var dateSelectionDelegate : DateSelectionDelegate? = nil
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateCollectionView.dataSource = dataSource
        dateCollectionView.delegate = self
        dateCollectionView.collectionViewLayout = DateCustomFlowLayout()

        
        monthLabel.text = getMonth()
    }
    
    //MARK: - Custom Methods
    // based on current Date, just extract the Month
    func getMonth() -> String {
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: currentDate as Date)
    }
    
    func getFullWeekdayString(_ selectedCell: DateCollectionViewCell) {
        // switch betwen text label so a full version can be passed
        switch selectedCell.weekdayLabel.text! {
        case "Mon":
            self.weekday = "Monday"
            break;
        case "Tues":
            self.weekday = "Tuesday"
            break;
        case "Wed":
            self.weekday = "Wendsday"
            break;
        case "Thu":
            self.weekday = "Thursday"
            break;
        case "Fri":
            self.weekday = "Friday"
            break;
        case "Sat":
            self.weekday = "Saturday"
            break;
        default:
            self.weekday = "Sunday"
        }
    }
    
    //MARK: - Collection View Delegate
    // user taps cell & check Mark appreas or disappears
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.item)
        
        let selectedCell = collectionView.cellForItem(at: indexPath) as! DateCollectionViewCell
        
        // checks to see if same cell was tapped or not
        if !isSelected {
            selectedCell.checkMarkImageView.alpha = 0.75
            isSelected = true
            // save the selected cell in user defaults cause it disappears when cells are reused
            defaults.set(true, forKey: "Date - \(indexPath.item)")
        } else {
            selectedCell.checkMarkImageView.alpha = 0
            isSelected = false
            defaults.set(false, forKey: "Date - \(indexPath.item)")
        }
        
        getFullWeekdayString(selectedCell)
        
        // if cell is selected, send the data bool of if selected
        if dateSelectionDelegate != nil {
            dateSelectionDelegate?.isDateSelected(isSelected,
                                                  weekday: self.weekday,
                                                  dayOfMonthNumber: selectedCell.dayOfMonthNumberLabel.text!,
                                                  currentMonth: getMonth(),
                                                  indexPath: indexPath)
        }
    }
    
    // user taps a different cell and check mark disappears
    func collectionView(_ collectionView: UICollectionView,
                        didDeselectItemAt indexPath: IndexPath) {
        
        print(indexPath.item)
        
        if let selectedCell = collectionView.cellForItem(at: indexPath) as?DateCollectionViewCell {
            
            selectedCell.checkMarkImageView.alpha = 0
            
            if dateSelectionDelegate != nil {
                dateSelectionDelegate?.isDateSelected(isSelected,
                                                      weekday: selectedCell.weekdayLabel.text!,
                                                      dayOfMonthNumber: selectedCell.dayOfMonthNumberLabel.text!,
                                                      currentMonth: getMonth(),
                                                      indexPath: indexPath)
            }
        }
        isSelected = false
        defaults.set(false, forKey: "Date - \(indexPath.item)")
    }
    
    //MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
