//
//  MyReservationsModel.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/19/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 10.0, *)
class MyReservationsModel: NSObject {
    
    //MARK: - Global Private variable
    private var searchResult : [MyReservations] = []
    
    //MARK:- Core Data Fetch
    // fetches data and puts it into arrau ot MyReservations
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
