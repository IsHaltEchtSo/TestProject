//
//  PinchGestureViewController.swift
//  TestProject
//
//  Created by Deniz Grollmusz on 20.04.20.
//  Copyright © 2020 Deniz Grollmusz. All rights reserved.
//

import UIKit

class PinchGestureViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var codeImageView: UIImageView!
    var pinchMe: UIPinchGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if codeImageView != nil {
            initCodeImagePinch()
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pinchDetected(_ sender: UIPinchGestureRecognizer) {
        imageView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    
    func initCodeImagePinch() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchDetector))
        view.backgroundColor = .orange
        codeImageView.addGestureRecognizer(pinch)
        codeImageView.isUserInteractionEnabled = true
        codeImageView.backgroundColor? = .black
//        pinchMe = pinch
    }
    
    @objc func pinchDetector(sender: UIPinchGestureRecognizer) {
        codeImageView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
