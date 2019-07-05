//
//  ViewController.swift
//  customProgressBar
//
//  Created by Estefanía Noguerón on 6/19/19.
//  Copyright © 2019 Estefanía Noguerón. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    var timer = Timer()
    var percetage = 0
    var array = ["0","10","20","30","40","50","60","70","80","90","100"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
        
        let gradientView = GradientView(frame: progressView.bounds)
        
        progressView.trackImage = UIImage(view: gradientView).withHorizontallyFlippedOrientation()
        
        progressView.transform = CGAffineTransform(scaleX: -1.0, y: -1.0)
        progressView.progressTintColor = UIColor.gray
        progressView.progress = 1
        
        
    }

    
    @objc func timerUpdate(){
        
        percetage += 10
        
        let invertedValue = Float(100 - percetage)/100
        progressView.setProgress(invertedValue, animated: true)
        
        if percetage == 100 {
            timer.invalidate()
        }
        
        label.text = "\(percetage)%"
    
    }
    
    
    
    
    
    

}


extension UIImage {
    
    convenience init(view: UIView) {
        
        
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
 
        }
    
    
    
    
    
}
    


