//
//  ViewController.swift
//  Example
//
//  Created by Rajesh Kumar Sahil on 13/02/2022.
//

import UIKit
import SignatureView

class ViewController: UIViewController {
    @IBOutlet weak var signatureView: SignatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setView()
    }

    @IBAction func undo(_ sender: Any) {
        signatureView.undo()
        
    }
    
    @IBAction func clear(_ sender: UIButton) {
        signatureView.delete()
    }
    
    func setView(){
        signatureView.delegate = self
        signatureView.signatureColor(color: .blue)
        signatureView.signatureLineCap(lineCap: .square)
        signatureView.signatureLineWidth(lineWidth: 10)
        signatureView.cornerRadius(radius: 30)
        signatureView.setBorder(withColor: .black, withWidth: 3)
        signatureView.backgroundColor(color: .cyan)
    }
}

extension ViewController: SignatureViewDelegate{
    func signatureDidStart() {
        print("Starts")
    }
    
    func signatureDidEnd() {
        print("Ends")
    }
    
    
}
