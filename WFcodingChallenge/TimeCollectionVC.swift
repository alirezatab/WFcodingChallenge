//
//  TimeCollectionVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "TimeCollectionViewCell"

class TimeCollectionVC: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var timeCollectionView: UICollectionView!
    var reservationTimes : [Date] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeCollectionView.dataSource = self
       
        let calendar = NSCalendar.current
        let components = NSDateComponents()
        let dateFormatter = DateFormatter()
        components.hour = 9
        var newTime = calendar.date(from: components as DateComponents)!
        
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        for _ in 0..<12 {
            print(dateFormatter.string(from: newTime))
            reservationTimes.append(newTime)
            newTime = calendar.date(byAdding: .hour, value: 1, to: newTime)!
        }
        
        print(reservationTimes.count)
        
        for i in 0..<12 {
            print(dateFormatter.string(from: reservationTimes[i]))
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = timeCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TimeCollectionViewCell
        
        cell.timeLabel.text = "Fuck Off Boyo"
        
        return cell
    }
    
}
