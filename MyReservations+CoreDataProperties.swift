//
//  MyReservations+CoreDataProperties.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/18/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import Foundation
import CoreData


extension MyReservations {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyReservations> {
        return NSFetchRequest<MyReservations>(entityName: "MyReservations");
    }

    @NSManaged public var messageType: String?
    @NSManaged public var partySize: String?
    @NSManaged public var reservationDate: NSDate?
    @NSManaged public var reservationDay: NSDate?
    @NSManaged public var reservationTime: NSDate?

}
