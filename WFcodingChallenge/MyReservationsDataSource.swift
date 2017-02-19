//
//  MyReservationsDataSource.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/19/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class MyReservationsDataSource: NSObject, UICollectionViewDataSource {
    
    //Mark: - Global Private constants
    private let reuseIdentifier = "MyReservationVC"
    private let myReservationsDataSource = MyReservationsModel()
    
    //Mark: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return myReservationsDataSource.getReservationsData().count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! MyReservationViewCell
        

        populateCellsWithData(cell, indexPath: indexPath)
        
        setButtonUI(cell)
        
        return cell
    }
    
    //Mark: - Custom functions
    func populateCellsWithData(_ cell: MyReservationViewCell, indexPath: IndexPath) {
        
        let searchResults = myReservationsDataSource.getReservationsData()
        
        let result = searchResults[indexPath.item]
        
        cell.massageDescriptionLabel.text = "Massage focused on the deepest layer of muscles to target knots and release chronic muscle tension."
        cell.DateLabel.text = result.reservationDate
        cell.massageTypeLabel.text = "Hot Stone Massage"
        cell.partySizeLabel.text = "PARTY SIZE - \(result.partySize!)"
        cell.timeLabel.text = result.reservationTime
    }
    
    // create rounder corner for the button and set contraints
    func setButtonUI(_ cell: MyReservationViewCell) {
        cell.rescheduleButton.layer.cornerRadius = 5
        cell.rescheduleButton.layer.masksToBounds = true
        cell.rescheduleButton.frame = CGRect(x: 20,
                                             y: cell.frame.height - 20 - 40,
                                             width: (cell.frame.width/2) - 20 - 10,
                                             height: 40)
        
        
        cell.cancelButton.layer.cornerRadius = 5
        cell.cancelButton.layer.masksToBounds = true
        cell.cancelButton.frame = CGRect(x: 20 + (cell.frame.width/2) - 10,
                                         y: cell.frame.height - 20 - 40,
                                         width: (cell.frame.width/2) - 20 - 10,
                                         height: 40)
    }
}
