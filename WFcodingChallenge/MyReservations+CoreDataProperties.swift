//
//  MyReservations+CoreDataProperties.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/19/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import Foundation
import CoreData


extension MyReservations {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyReservations> {
        return NSFetchRequest<MyReservations>(entityName: "MyReservations");
    }

    @NSManaged public var partySize: String?
    @NSManaged public var reservationDate: String?
    @NSManaged public var reservationDay: String?
    @NSManaged public var reservationTime: String?

}
