//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ankhe Tomer on 4/16/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var totalText : Double = 0.00
    var summaryText : String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsLabel.text = summaryText
        totalLabel.text = String(totalText)
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
