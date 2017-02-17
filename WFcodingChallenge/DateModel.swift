//
//  DateModel.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class DateModel: NSObject {
    
    private let currentDate = NSDate()
    private let calendar = NSCalendar.current
    private let lengthOfMonth : TimeInterval = 0
    private var componentsFirst = NSDateComponents()
    private let componentsLast = NSDateComponents()
    private let dateFormatter = DateFormatter()

    //Mark: - Private Custom methods
    private func getStartOfMonth() -> Date {
        // get month and year date component fromt current date
        componentsFirst = calendar.dateComponents([.year, .month], from: currentDate as Date) as NSDateComponents
        
        // get first day of month
        let startOfMonth = calendar.date(from: componentsFirst as DateComponents)!
        
        return startOfMonth
    }
    
    private func getEndOfMonth() -> Date {
        
        // get first day of month
        let startOfMonth = getStartOfMonth()
        
        // get the last day of month
        componentsLast.month = 1
        componentsLast.day = -1
        
        let endOfMonth = calendar.date(byAdding: componentsLast as DateComponents, to: startOfMonth)!
        
        return endOfMonth
    }
    
    //Mark: - Public Custom methods
    // puts all the days of month into dates Array
    func getAllDaysOfMonth() -> [Date] {

        let startOfMonth = getStartOfMonth()
        let endOfMonth = getEndOfMonth()
        
        let normalizedStartDate = calendar.startOfDay(for: startOfMonth)
        let normalizedEndDate = calendar.startOfDay(for: endOfMonth)
        
        // put the dates into an array
        var dates = [normalizedStartDate]
        var date = normalizedStartDate
        repeat {
            date = calendar.date(byAdding: .day, value: 1, to: date)!
            dates.append(date as Date)
        } while !calendar.isDate(date as Date, inSameDayAs: normalizedEndDate)
        
        return dates
    }
}
