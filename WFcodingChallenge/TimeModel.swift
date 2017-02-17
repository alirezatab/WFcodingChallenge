//
//  TimeModel.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class TimeModel: NSObject {

    private let calendar = NSCalendar.current
    private let components = NSDateComponents()
    private let dateFormatter = DateFormatter()
    private var reservationTimes : [Date] = []
    private let closingHour = "9:00 PM"

    func getReservationTimeIntervals() -> [Date] {
        
        // set the starting hour
        components.hour = 9
        
        // date Formatter- hh to avoid military time
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        // create hour time interval
        var time = calendar.date(from: components as DateComponents)!
        
        let timeString = dateFormatter.string(from: time)
        // put the hour into an array and inceremnt it by 1 HR
        while timeString != closingHour {
            reservationTimes.append(time)
            time = calendar.date(byAdding: .hour, value: 1, to: time)!
        }
        
        return reservationTimes
    }
}
