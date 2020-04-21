//
//  RotationGestureViewController.swift
//  TestProject
//
//  Created by Deniz Grollmusz on 20.04.20.
//  Copyright © 2020 Deniz Grollmusz. All rights reserved.
//

import UIKit

class RotationGestureViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contTextField: UITextField!
    @IBOutlet weak var contLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    var oldEmoji: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        imageView.isUserInteractionEnabled = true
        initRotationGesture()
        contLabel.text = contTextField.text
        contTextField.addTarget(self, action: #selector(RotationGestureViewController.startEdit(_:)), for: UIControl.Event.editingDidBegin)
        
        NotificationCenter.default.addObserver(self, selector: #selector(startEdit(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotationDetected))
        view.addGestureRecognizer(rotate)
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchor))
        view.addGestureRecognizer(pinch)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        imageView.addGestureRecognizer(tap)
//        contLabel.isHidden = true
//        contTextField.isHidden = true
    }
    
    @objc func tapDetected(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
//        if contTextField.isHidden {
//            contLabel.isHidden = false
//            contTextField.isHidden = false
//        } else {
//            contTextField.isHidden = true
//            contLabel.isHidden = true
//        }
    }
    
    @objc func rotationDetected(_ sender: UIRotationGestureRecognizer) {
        imageView.transform = CGAffineTransform(rotationAngle: sender.rotation)
        emojiLabel.text = "🤢"
        emojiLabel.transform = CGAffineTransform(scaleX: sender.rotation, y: sender.rotation)
    }
    
    @objc func pinchor(_ sender: UIPinchGestureRecognizer) {
        imageView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        emojiLabel.text = "😮"
        emojiLabel.transform = CGAffineTransform(rotationAngle: sender.scale * 10)
    }
    
    func initRotationGesture() {
        imageView.backgroundColor = .black
    }
    
    @objc func startEdit(_ textField: UITextField) {
        contLabel.text = "hi " + contTextField.text!
        oldEmoji = emojiLabel.text
        emojiLabel.text = "⌨️"
    }

    @IBAction func changeEdit(_ sender: Any) {
        contLabel.text = contTextField.text
    }
    
    @IBAction func endEdit(_ sender: Any) {
        emojiLabel.text = oldEmoji!
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
