//
//  SpaServiceVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class SpaServiceVC: UIViewController, UIScrollViewDelegate {

    //MARK: - IBOutlets
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    private var reserveButton: UIButton!
    
    //MARK: - Global Private constants
    private let scrollWidth : CGFloat = UIScreen.main.bounds.size.width
    private let scrollHeight : CGFloat = UIScreen.main.bounds.size.height - 64
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // round the edges of ContainerView
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
        
        
        // setup the size o the scrollView - 3 is cause we have 3 pages
        scrollView?.contentSize = CGSize(width: (scrollWidth * 3),
                                         height: scrollHeight)
        
        //set the delegate of control view
        scrollView?.delegate = self;
        scrollView?.isPagingEnabled = true
        
        setupOfferPages()
        
        // only leaves the arrow of the back button
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ",
                                                                style: .plain,
                                                                target: nil,
                                                                action: nil)
        
        // change the color of back button to white
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    //MARK: - Scroll View Delegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }
    
    // calculates the page number based on calculation
    func setIndiactorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
    
    //MARK: - Custom Methods
    // assign the correct image to the correct page using for-Loop
    func setupOfferPages() {
        for i in 0...2 {
            
            // create & insert imageview inside scrollerView
            let imageView = UIImageView.init()
            imageView.frame = CGRect(x: scrollWidth * CGFloat (i),
                                     y: 0,
                                     width: scrollWidth,
                                     height: scrollHeight)
            
            // create & insert button inside scrollerView
            let frame = CGRect(x: scrollWidth * CGFloat (i) + 25,
                               y: (view.bounds.height/3.35),
                               width: 175,
                               height: 44)
            
            reserveButton = UIButton(frame: frame)
            reserveButton.backgroundColor = .blue
            reserveButton.setTitle("RESERVATION", for: .normal)
            reserveButton.addTarget(self,
                                    action: #selector(onReservationButtonPressed),
                                    for: .touchUpInside)
            
            // round the edges of Reservation Button
            reserveButton.layer.cornerRadius = 5
            reserveButton.layer.masksToBounds = true
            
            // Based on which page, assign image to background
            // enable and disable buttons based on page #s
            switch i {
            case 1:
                imageView.image = UIImage(named: "HotStoneOffer")
                reserveButton.isEnabled = true
            case 2:
                imageView.image = UIImage(named: "DeepTissueOffer")
                reserveButton.isEnabled = false
                
            default:
                imageView.image = UIImage(named: "MothersDayOffer")
                reserveButton.isEnabled = false
                
            }
            
            scrollView?.addSubview(imageView)
            scrollView?.addSubview(reserveButton)
        }
    }
    
    // MARK: - IBActions
    // change page based on taps on pageController
    @IBAction func onPageControllerTapped() {
        scrollView!.scrollRectToVisible(CGRect( x: scrollWidth * CGFloat ((pageControl?.currentPage)!),
                                                y: 0,
                                                width: scrollWidth,
                                                height: scrollHeight),
                                        animated: true)
    }
    
    func onReservationButtonPressed(sender: UIButton!) {
        print("button pressed")
        performSegue(withIdentifier: "ReservationButtonPressed",
                     sender: sender)
    }
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
