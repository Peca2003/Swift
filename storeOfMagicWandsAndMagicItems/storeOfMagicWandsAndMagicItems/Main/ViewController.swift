//
//  ViewController.swift
//  storeOfMagicWandsAndMagicItems
//
//  Created by Студент on 18.02.2023.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "Tabbar")
        self.navigationController?.pushViewController(viewController, animated: false)
    }
}
