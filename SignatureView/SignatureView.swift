//
//  SignatureView.swift
//  SignatureView
//
//  Created by Rajesh Kumar Sahil on 16/01/2022.
//


import Foundation
import UIKit

public protocol SignatureViewDelegate: AnyObject {
    func signatureDidStart()
    func signatureDidEnd()
}

public class SignatureView: UIView{
    var line = [CGPoint]()
    var lines = [[CGPoint]]()
    
    public weak var delegate: SignatureViewDelegate?
    
    private var signatureColor : UIColor = .black
    private var signatureLineWidth : CGFloat = 2
    private var signatureLineCap : CGLineCap = .butt
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}

        //setup context view
        context.setStrokeColor(signatureColor.cgColor)
        context.setLineWidth(signatureLineWidth)
        context.setLineCap(signatureLineCap)

        lines.forEach { (line) in
            for (index, point) in line.enumerated(){
                if index == 0{
                    context.move(to: point)
                }else{
                    context.addLine(to: point)
                }
            }
        }
        context.strokePath()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.delegate?.signatureDidStart()
        lines.append([CGPoint]())
    }

    //track the fingure as we move on view
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else {return}
        guard var lastLine = lines.popLast() else {return}
        lastLine.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.delegate?.signatureDidEnd()
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
}

//Mark: View Setup Func
extension SignatureView{
    
    public func isEmpty() ->Bool{
        return lines.isEmpty ? true : false
    }
    
    public func delete(){
        if !lines.isEmpty{
            self.lines.removeAll()
            setNeedsDisplay()
        }
    }
    
    public func undo(){
        if !lines.isEmpty {
            self.lines.removeLast()
            setNeedsDisplay()
        }
    }
    
    public func setBorder(withColor color: UIColor, withWidth width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    public func backgroundColor(color: UIColor) {
        self.backgroundColor = color
    }
    
    public func cornerRadius(radius : CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        
    }
    
    public func getSignature() -> UIImage{
        let render = UIGraphicsImageRenderer(size: self.bounds.size)
        let image = render.image { (imageRendererContext) in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
        return image
    }
    
    public func signatureColor(color: UIColor){
        self.signatureColor = color
    }
    
    public func signatureLineWidth(lineWidth: CGFloat){
        self.signatureLineWidth = lineWidth
    }
    
    public func signatureLineCap(lineCap: CGLineCap){
        self.signatureLineCap = lineCap
    }
}
