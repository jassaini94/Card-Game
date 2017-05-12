//
//  ViewController.swift
//  CardGame
//
//  Created by Jas on 11/16/16.
//  Copyright © 2016 Saini. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var RightCardView: UIImageView!
    @IBOutlet weak var LeftCardView: UIImageView!
    
    @IBOutlet weak var PlayerScoreLabel: UILabel!
    @IBOutlet weak var CPUScoreLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    
    let deck = ["ace", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DealButton(sender: UIButton)
    {
        let delay = DispatchTime.now() + 1
        let leftNum = Int(arc4random_uniform(13))
        let rightNum = Int(arc4random_uniform(13))
        
        LeftCardView.image = UIImage(named: deck[leftNum])
        RightCardView.image = UIImage(named: deck[rightNum])
        
        DispatchQueue.main.asyncAfter(deadline: delay)
        {
        
            if (leftNum > rightNum)
            {
                self.leftScore += 1
                self.PlayerScoreLabel.text = String(self.leftScore)
            }
        
            else if (rightNum > leftNum)
            {
                self.rightScore += 1
                self.CPUScoreLabel.text = String(self.rightScore)
            }
        
            else
            {
                //It's a tie//
            }
        }
    }
}

