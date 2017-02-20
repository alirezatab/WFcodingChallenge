//
//  DateCollectionViewDataSource.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class DateCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    //MARK: - Global Private constants
    private let dataSource = DateModel()
    private let dateFormatter = DateFormatter()
    private let reuseIdentifier = "DateCollectionViewCell"
    private var defaults = UserDefaults.standard
    
    //MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.getAllDaysOfMonth().count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DateCollectionViewCell
        
        // for 3 letter day EEE
        dateFormatter.dateFormat = "EEE"
        let dates = dataSource.getAllDaysOfMonth()
        
        // downcasting to string to be inserted in text
        cell.weekdayLabel.text = dateFormatter.string(from: dates[indexPath.row])
        cell.dayOfMonthNumberLabel.text = String(indexPath.row + 1)
        
        cell.checkMarkImageView.alpha = 0
        
        let savedIndexPathItem = defaults.bool(forKey: "\(indexPath.item)")
        
        if savedIndexPathItem == true {
            cell.checkMarkImageView.alpha = 0.75
        }
        
        return cell
    }
}
