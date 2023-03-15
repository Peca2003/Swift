//
//  MagicItemViewController.swift
//  storeOfMagicWandsAndMagicItems
//
//  Created by Студент on 20.02.2023.
//

import UIKit

class MagicItemViewController: UIViewController
{

    @IBOutlet weak var bonusLabel: UILabel!
    @IBOutlet weak var countBonusesUsed: UITextField!
    @IBOutlet weak var priceMagicItem: UILabel!
    @IBOutlet weak var priceMagicItem1: UILabel!
    @IBOutlet weak var priceMagicItem2: UILabel!
    @IBOutlet weak var priceMagicItem3: UILabel!
    
    var priceResurrectionStone = 25000
    var priceGoldenSnitch = 20000
    var priceFlywheelTime = 14000
    var priceInvisibilityCloak = 7000
    let defaults = UserDefaults.standard
    var bonusSave = 0
    
    func loadBonusLabel() { bonusLabel.text = "\(defaults.integer(forKey: "bonus1"))" }
    
    @IBAction func usedBonusesButton(_ sender: Any)
    {
        if let bonus: Int = (Int) (countBonusesUsed.text!)
        {
            priceMagicItem.text = String(priceResurrectionStone - bonus)
            bonusSave = PromotionViewController().defaults.integer(forKey: "bonus") - bonus
            defaults.set(bonusSave, forKey: "bonus1")
            //bonusLabel.text = String(bonusSave)
            PromotionViewController().initialBonus = defaults.integer(forKey: "bonus1")
        }
    }
    @IBAction func usedBonusesButton1(_ sender: Any)
    {
        if let bonus: Int = (Int) (countBonusesUsed.text!)
        {
            priceMagicItem1.text = String(priceGoldenSnitch - bonus)
            bonusSave = PromotionViewController().defaults.integer(forKey: "bonus") - bonus
            defaults.set(bonusSave, forKey: "bonus1")
            //bonusLabel.text = String(bonusSave)
            PromotionViewController().initialBonus = defaults.integer(forKey: "bonus1")
        }
    }
    @IBAction func usedBonusesButton2(_ sender: Any)
    {
        if let bonus: Int = (Int) (countBonusesUsed.text!)
        {
            priceMagicItem2.text = String(priceFlywheelTime - bonus)
            bonusSave = PromotionViewController().defaults.integer(forKey: "bonus") - bonus
            defaults.set(bonusSave, forKey: "bonus1")
            //bonusLabel.text = String(bonusSave)
            PromotionViewController().initialBonus = defaults.integer(forKey: "bonus1")
        }
    }
    @IBAction func usedBonusesButton3(_ sender: Any)
    {
        if let bonus: Int = (Int) (countBonusesUsed.text!)
        {
            priceMagicItem3.text = String(priceInvisibilityCloak - bonus)
            bonusSave = PromotionViewController().defaults.integer(forKey: "bonus") - bonus
            defaults.set(bonusSave, forKey: "bonus1")
            //bonusLabel.text = String(bonusSave)
            PromotionViewController().initialBonus = defaults.integer(forKey: "bonus1")
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        priceMagicItem.text = String(priceResurrectionStone)
        priceMagicItem1.text = String(priceGoldenSnitch)
        priceMagicItem2.text = String(priceFlywheelTime)
        priceMagicItem3.text = String(priceInvisibilityCloak)
        //loadBonusLabel()
    }
}
