//
//  NumberButton.swift
//  literally recreating calculator for some reason
//
//  Created by Gavin Craft on 5/18/21.
//

import UIKit
class NumberButton: CalculatorButton{
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
class CalculatorButton: UIButton{
    func makeRound(){
        self.layer.cornerRadius = 42
        self.layer.masksToBounds = true
    }
    func setFontAndConstraints(){
        let font = UIFont(name: "Arial-BoldMT", size: 36)
        self.titleLabel?.font = font
        switch self{
        case is StrangerButton:
            self.setTitleColor(UIColor(named: "strangeTextColor"), for: .normal)
        default:
            self.setTitleColor(UIColor(named: "textColor"), for: .normal)
        }
        self.makeConstraints()
        self.makeRound()
        self.setColor()
    }
    func setText(text: String){
        self.setTitle(text, for: .normal)
    }
    func makeConstraints(){
        //self.clipsToBounds = true
        
        self.contentHorizontalAlignment = .center
        if(self.titleLabel?.text == "0"){
            let aspecth = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 2, constant: 0)
            let aspectw = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 2, constant: 0)
            self.addConstraints([aspecth,aspectw])
        }else{
            let aspecth = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
            let aspectw = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 2, constant: 0)
            self.addConstraints([aspecth, aspectw])
        }
    }
    func setColor(){
        switch self{
        case is NumberButton:
            self.backgroundColor = UIColor(named: "numberButtonColor")
        case is FunctionButton:
            self.backgroundColor = UIColor(named: "functionButtonColor")
        default:
            self.backgroundColor = UIColor(named: "strangeButtonColor")
            self.setTitleColor(.black, for: .normal)
        }
    }
}
