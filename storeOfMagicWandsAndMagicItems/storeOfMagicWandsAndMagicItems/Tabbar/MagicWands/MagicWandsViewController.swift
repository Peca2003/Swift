import UIKit

class MagicWandsViewController: UIViewController
{
    @IBOutlet weak var labelBonus: UILabel!
    @IBOutlet weak var countBonusesUsed: UITextField!
    @IBOutlet weak var priceMagicWand: UILabel!
    @IBOutlet weak var priceMagicWand1: UILabel!
    @IBOutlet weak var priceMagicWand2: UILabel!
    @IBOutlet weak var priceMagicWand3: UILabel!
    
    
    func loadBonusLabel() { labelBonus.text = "\(defaults.integer(forKey: "bonus1"))" }
    var price = 5500
    var price1 = 6200
    var price2 = 6700
    var price3 = 7000
    var bonusSave = 0
    let defaults = UserDefaults.standard
    @IBAction func usedBonusesButton(_ sender: Any)
    {
        if let bonus: Int = (Int) (countBonusesUsed.text!)
        {
            priceMagicWand.text = String(price - bonus)
            bonusSave = PromotionViewController().defaults.integer(forKey: "bonus") - bonus
            defaults.set(bonusSave, forKey: "bonus1")
            //labelBonus.text = String(bonusSave)
            PromotionViewController().initialBonus = defaults.integer(forKey: "bonus1")
        }
    }
    
    @IBAction func usedBonusesButton1(_ sender: Any)
    {
        if let bonus: Int = (Int) (countBonusesUsed.text!)
        {
            priceMagicWand1.text = String(price1 - bonus)
            bonusSave = PromotionViewController().defaults.integer(forKey: "bonus") - bonus
            defaults.set(bonusSave, forKey: "bonus1")
            //labelBonus.text = String(bonusSave)
            PromotionViewController().initialBonus = defaults.integer(forKey: "bonus1")
        }
    }
    
    @IBAction func usedBonusesButton2(_ sender: Any)
    {
        if let bonus: Int = (Int) (countBonusesUsed.text!)
        {
            priceMagicWand2.text = String(price2 - bonus)
            bonusSave = PromotionViewController().defaults.integer(forKey: "bonus") - bonus
            defaults.set(bonusSave, forKey: "bonus1")
            //labelBonus.text = String(bonusSave)
            PromotionViewController().initialBonus = defaults.integer(forKey: "bonus1")
        }
    }
    
    
    @IBAction func usedBonusesButton3(_ sender: Any)
    {
        if let bonus: Int = (Int) (countBonusesUsed.text!)
        {
            priceMagicWand3.text = String(price3 - bonus)
            bonusSave = PromotionViewController().defaults.integer(forKey: "bonus") - bonus
            defaults.set(bonusSave, forKey: "bonus1")
            //labelBonus.text = String(bonusSave)
            PromotionViewController().initialBonus = defaults.integer(forKey: "bonus1")
        }
    }
    
    
    
    
    func loadLabelBonus()
    {
        labelBonus.text = "\(defaults.integer(forKey: "bonus1"))"
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        priceMagicWand.text = "\(price)"
        priceMagicWand1.text = "\(price1)"
        priceMagicWand2.text = "\(price2)"
        priceMagicWand3.text = "\(price3)"
        //loadBonusLabel()
    }
}
