//
//  ViewController.swift
//  MyApp
//
//  Created by Алексей Пархоменко on 24.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var salesCountLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: NSLocalizedString("imageName", comment: ""))
        likeButton.setTitle(NSLocalizedString("You like?", comment: ""), for: .normal)
        
    }

    @IBAction func likeButtonPressed(_ sender: Any) {
        guard salesCountLabel.isHidden else { return }
        
        
        let formatString = NSLocalizedString("You have sold 1000 apps in %d months", comment: "")
        let period = getMonthCount()
        let quantity = NumberFormatter.localizedString(from: 1000, number: .decimal)
        salesCountLabel.text = String.localizedStringWithFormat(formatString, quantity, period)
        
        salesCountLabel.isHidden = false
        imageView.isHidden = false
        salesCountLabel.alpha = 0
        imageView.alpha = 0
        likeButton.isEnabled = false
        
        UIView.animate(withDuration: 1, animations: {
            self.salesCountLabel.alpha = 1
            self.imageView.alpha = 1
        }) { (finished) in
            if finished {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.salesCountLabel.isHidden = true
                    self.imageView.isHidden = true
                    self.likeButton.isEnabled = true
                }
            }
        }
    
    }
    
    private func getMonthCount() -> Int {
        let choices = [1,2,5]
        return choices.randomElement()!
    }
}

