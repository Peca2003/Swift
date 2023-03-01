import UIKit

class PromotionViewController: UIViewController
{
    @IBOutlet weak var bonusLabel: UILabel!
    
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
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(ResponseData.self, from: data)
                return jsonData.promo
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    var promoArray = [Promo]()
    
     func encoderJsonFiles()
     {
         do
         {
             let jsonData = try JSONEncoder().encode(promoArray)
             if let jsonString = String(data: jsonData, encoding: .utf8) { print(jsonString) }
         } catch { print(error.localizedDescription) }
      }
    
    
    var initialBonus: Int = 200
    
    @IBAction func firstPromo(_ sender: Any)
    {
        initialBonus += promoArray[0].bonus
        bonusLabel.text = "\(initialBonus)"
        promoArray[3].bonus = initialBonus
        encoderJsonFiles()
    }
    
    @IBAction func secondPromo(_ sender: Any)
    {
        initialBonus += promoArray[1].bonus
        bonusLabel.text = "\(initialBonus)"
        promoArray[3].bonus = initialBonus
        encoderJsonFiles()
    }
    
    @IBAction func thirdPromo(_ sender: Any)
    {
        initialBonus += promoArray[2].bonus
        bonusLabel.text = "\(initialBonus)"
        promoArray[3].bonus = initialBonus
        encoderJsonFiles()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        promoArray = loadJson(filename: "data")!
    }
}

//https://question-it.com/questions/133081/swift-5-xcode-11-betas-5-6-kak-zapisat-v-fajl-json
