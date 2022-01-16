//
//  SignatureView.swift
//  SignatureView
//
//  Created by Rajesh Kumar Sahil on 16/01/2022.
//


import Foundation
import UIKit

//protocol SignatureViewDelegate: AnyObject {
//    func enableScrolling()
//    func disableScrolling()
//}

public class SignatureView: UIView{
    var line = [CGPoint]()
    var lines = [[CGPoint]]()
    
//    weak var delegate: SignatureViewDelegate?
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}

        //setup context view
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(4)
        context.setLineCap(.butt)

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
//        self.delegate?.disableScrolling()
        lines.append([CGPoint]())
    }

    //track the fingure as we move on view
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.delegate?.disableScrolling()
        guard let point = touches.first?.location(in: self) else {return}
        print(point)
        guard var lastLine = lines.popLast() else {return}
        lastLine.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
    
//    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.delegate?.enableScrolling()
//    }
//
//    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.delegate?.enableScrolling()
//    }
    
    
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
        self.layer.cornerRadius = radius
    }
    
    public func getSignature() -> UIImage{
        let render = UIGraphicsImageRenderer(size: self.bounds.size)
        let image = render.image { (imageRendererContext) in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
        return image
    }
}
