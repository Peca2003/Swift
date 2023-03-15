import UIKit
import Foundation

class PromotionViewController: UIViewController
{
    @IBOutlet weak var bonusLabel: UILabel!
    @IBOutlet weak var segmentedControlFaculty: UISegmentedControl!
    
    struct ResponseData: Codable { var promo: [Promo] }
    struct Promo: Codable
    {
        var title: String
        var bonus: Int
    }
    
    
     func loadJson(filename fileName: String) -> [Promo]?
     {
         if let url = Bundle.main.url(forResource: fileName, withExtension: "json")
         {
             do
             {
                 let data = try Data(contentsOf: url)
                 let jsonData = try JSONDecoder().decode(ResponseData.self, from: data)
                 return jsonData.promo
             }
             catch { print("error:\(error)") }
         }
         return nil
     }

    var promoArray = [Promo]()
    
    let defaults = UserDefaults.standard
    var initialBonus: Int = 0
    
    @IBAction func firstPromo(_ sender: Any)
    {
        let faculty = [promoArray[0].bonus, promoArray[1].bonus, promoArray[2].bonus, promoArray[3].bonus]
        let selectedFaculty = faculty[segmentedControlFaculty.selectedSegmentIndex]
        initialBonus += selectedFaculty
        bonusLabel.text = "\(initialBonus)"
        savedInitialBonus()
    }
    
    @IBAction func secondPromo(_ sender: Any)
    {
        initialBonus += promoArray[4].bonus
        bonusLabel.text = "\(initialBonus)"
        savedInitialBonus()
    }
    
    @IBAction func thirdPromo(_ sender: Any)
    {
        initialBonus += promoArray[5].bonus
        bonusLabel.text = "\(initialBonus)"
        savedInitialBonus()
    }
    
    func savedInitialBonus() { defaults.set(initialBonus, forKey: "bonus") }
    func loadBonusLabel() { bonusLabel.text = "\(defaults.integer(forKey: "bonus"))" }
    func loadInitialBonus() { initialBonus = defaults.integer(forKey: "bonus") }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        promoArray = loadJson(filename: "data")!
        loadBonusLabel()
        loadInitialBonus()
        bonusLabel.text = String(MagicWandsViewController().defaults.integer(forKey: "bonus1"))
        initialBonus = MagicWandsViewController().defaults.integer(forKey: "bonus1")
    }
}
