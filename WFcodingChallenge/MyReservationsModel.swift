//
//  MyReservationsModel.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/19/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit
import CoreData

class MyReservationsModel: NSObject {

    private var searchResult : [MyReservations] = []
    
    func getReservationsData() -> [MyReservations] {
        let fetchRequest : NSFetchRequest<MyReservations> = MyReservations.fetchRequest()
        
        do {
            self.searchResult = try CoreDataStack.getContext().fetch(fetchRequest)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return self.searchResult
    }
    
}
