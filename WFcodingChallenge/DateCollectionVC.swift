//
//  DateCollectionVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

    private let reuseIdentifier = "DateCollectionViewCell"

class DateCollectionVC: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var dateCollectionView: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    
    private var daysInMonth = Int()
    private var dayOfMonthNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateCollectionView.dataSource = self
        
        let currentDate = NSDate()
        let calendar = NSCalendar.current
        
        // based on current Date, just extract the Month
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"

        let month = dateFormatter.string(from: currentDate as Date)
        
        monthLabel.text = month
        
        
        // get month and year date component fromt current date
        let components = calendar.dateComponents([.year, .month], from: currentDate as Date)
        
        let lengthOfMonth : TimeInterval = 0
        
        // get first day of month
        let startOfMonth = calendar.date(from: components)!

        // get the last day of month
        let components2 = NSDateComponents()
        components2.month = 1
        components2.day = -1
        let endOfMonth = calendar.date(byAdding: components2 as DateComponents, to: startOfMonth)!
        
        let numberOfDaysInMonth = calendar.range(of: .day, in: .month, for: startOfMonth)?.count
        
        let normalizedStartDate = calendar.startOfDay(for: startOfMonth)
        let normalizedEndDate = calendar.startOfDay(for: endOfMonth)
        print(normalizedEndDate)
        
        var dates = [normalizedStartDate]
        var date = normalizedStartDate
        repeat {
            date = calendar.date(byAdding: .day, value: 1, to: date)!
            dates.append(date as Date)
        } while !calendar.isDate(date as Date, inSameDayAs: normalizedEndDate)
        
        dateFormatter.dateFormat = "EEE"
        
        daysInMonth = numberOfDaysInMonth!
        print(dates.count)
        
        for i in 0..<daysInMonth {
            print(dateFormatter.string(from: dates[i]))
        }

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysInMonth
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DateCollectionViewCell
        
        cell.weekdayLabel.text = "Mon"
        
        // downcasting int to string to be inserted in text
        cell.dayOfMonthNumberLabel.text = String(dayOfMonthNumber)
        
        // incerement the days by one
        dayOfMonthNumber += 1
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
