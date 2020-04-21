//
//  DetailViewController.swift
//  TestProject
//
//  Created by Deniz Grollmusz on 19.04.20.
//  Copyright © 2020 Deniz Grollmusz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var segmentLabel: UISegmentedControl!
    

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = testLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
        segmentButton(self)
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    @IBAction func segmentButton(_ sender: Any) {
        if segmentLabel.selectedSegmentIndex == 0 {
            testLabel.text = "First"
        } else if segmentLabel.selectedSegmentIndex == 1 {
            testLabel.text = "Second"
        } else if segmentLabel.selectedSegmentIndex == 2 {
            testLabel.text = "Third"
        }
    }
    
    @IBAction func changeSegmentButton(_ sender: UIButton) {
        if (sender as UIButton).tag == 1 {
            segmentLabel.insertSegment(withTitle: "Third", at: 2, animated: true)
            testLabel.text = sender.titleLabel?.text
        } else if (sender as AnyObject).accessibilityIdentifier == "firstButton" {
            segmentLabel.insertSegment(withTitle: "Forth", at: 2, animated: true)
        }
    }
    
}

