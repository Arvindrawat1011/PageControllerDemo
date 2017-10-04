//
//  ViewController.swift
//  PageControllerDemo
//
//  Created by Appinventiv Technologies on 03/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //  MARK:- Outlets..
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var roundImage: UIImageView!
    @IBOutlet weak var pageCounter: UIPageControl!
    
    //  MARK:- VARIABLE'S..
    let Car: [String] = ["Ford","Swift","Vitara","Ford","Swift","Vitara"]
    var timer: Timer!
    var updateCounter: Int!
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makingCircleView()
        self.updateCounter = 0
        self.timer = Timer.scheduledTimer(timeInterval:2,target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        
    }
    
    func makingCircleView(){
        roundImage.layer.cornerRadius = roundImage.frame.height / 2
        redView.layer.cornerRadius = redView.frame.height/2
        roundImage.clipsToBounds = true
        
    }
    
    @objc func updateTimer () {
        
        
        if (updateCounter < Car.count){
            roundImage.image = UIImage(named:Car[updateCounter])
            self.pageCounter.currentPage = updateCounter
            UIView.animate(withDuration: 1, delay: 0.1, options:[.repeat,.autoreverse], animations: {
                
                self.redView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
     
            }, completion: nil)

            self.updateCounter = self.updateCounter + 1
            
        }else{
            
            self.updateCounter = 0
        }
    }
}
