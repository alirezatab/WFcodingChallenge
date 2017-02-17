//
//  DateCollectionViewDataSource.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DateCollectionViewCell"

class DateCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private let dateFormatter = DateFormatter()
    private let dataSource = DateModel()
    
    //Mark: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.getAllDaysOfMonth().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DateCollectionViewCell
        
        dateFormatter.dateFormat = "EEE"
        let dates = dataSource.getAllDaysOfMonth()
        
        // downcasting to string to be inserted in text
        cell.weekdayLabel.text = dateFormatter.string(from: dates[indexPath.row])
        cell.dayOfMonthNumberLabel.text = String(indexPath.row + 1)
        
        return cell
    }
}