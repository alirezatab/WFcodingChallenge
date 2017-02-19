//
//  DateCollectionViewCell.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var dayOfMonthNumberLabel: UILabel!
    @IBOutlet weak var checkMarkImageView: UIImageView!

    //Mark: - custom Initilizers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //Mark: - custom Method
    // created border around the cell
    func setup() {
        self.layer.borderWidth = 0.75
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
