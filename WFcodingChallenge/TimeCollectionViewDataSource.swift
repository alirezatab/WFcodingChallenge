//
//  TimeCollectionViewDataSource.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "TimeCollectionViewCell"

class TimeCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private let dataSource = TimeModel()
    private let dateFormatter = DateFormatter()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.getReservationTimeIntervals().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TimeCollectionViewCell
        
        // dateFormatter indicates how the string will look like
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        // get the array of times
        let times = dataSource.getReservationTimeIntervals()
        
        cell.timeLabel.text = dateFormatter.string(from: times[indexPath.row])
        
        return cell
    }
}
