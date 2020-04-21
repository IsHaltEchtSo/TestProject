//
//  TouchGestureViewController.swift
//  TestProject
//
//  Created by Deniz Grollmusz on 19.04.20.
//  Copyright © 2020 Deniz Grollmusz. All rights reserved.
//

import UIKit

class TapGestureViewController: UIViewController {

    @IBOutlet weak var programLabel: UILabel!
    
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initProgramLabelTap()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - IBActions
    
    @IBAction func tapDetected(_ sender: Any) {
        print("Tap detected")
    }
    
    
    // MARK: - Functions
    
    func initProgramLabelTap() {
        programLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.numberOfTapsRequired = 2
        programLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        print("Tap on second label detected")
    }
}
