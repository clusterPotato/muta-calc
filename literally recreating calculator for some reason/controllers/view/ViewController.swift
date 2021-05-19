//
//  ViewController.swift
//  literally recreating calculator for some reason
//
//  Created by Gavin Craft on 5/18/21.
//

import UIKit

class MainViewController: UIViewController {
    override func loadView() {
        super.loadView()
        makeEveryButton()
        view.backgroundColor = UIColor(named: "bg")
        
        setupStackViews()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func makeAndConstrainLabel(){
        
        calcyLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView = UIImageView(image: UIImage(named: "muta"))
        imageView.contentMode = .scaleToFill
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: mainFatBoiStack.topAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0).isActive = true
        calcyLabel.text = currentNumberString
        let font = UIFont(name: "Arial-BoldMT", size: 36)
        calcyLabel.font = font
        calcyLabel.textAlignment = .right
        calcyLabel.textColor = .white
        self.view.addSubview(calcyLabel)
        calcyLabel.bottomAnchor.constraint(equalTo: mainFatBoiStack.topAnchor, constant: -24).isActive = true
        calcyLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8).isActive = true
        calcyLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8).isActive = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("didap")
        constrainStackBoi()
        makeAndConstrainLabel()
        
    }
    
    
    //MARK: - funcy boi functions
    func makeEveryButton(){
        //going to make an array for each row, top down
        makeRow1()
        makeRow2()
        makeRow3()
        makeRow4()
        makeRow5()
    }
    func setupStackViews(){
        mainFatBoiStack.axis = .vertical
        
        mainFatBoiStack.distribution = .fillEqually
        let sv0 = makeTopStack()
        sv0.translatesAutoresizingMaskIntoConstraints = false
        mainFatBoiStack.addArrangedSubview(sv0)
        //        view.addSubview(sv0)
        let sv1 = make7Stack()
        mainFatBoiStack.addArrangedSubview(sv1)
        sv1.translatesAutoresizingMaskIntoConstraints = false
        //        view.addSubview(sv1)
        let sv2 = make4Stack()
        sv2.translatesAutoresizingMaskIntoConstraints = false
        mainFatBoiStack.addArrangedSubview(sv2)
        //        view.addSubview(sv2)
        let sv3 = make1Stack()
        mainFatBoiStack.addArrangedSubview(sv3)
        //        view.addSubview(sv3)
        sv3.translatesAutoresizingMaskIntoConstraints = false
        let sv4 = make0Stack()
        sv4.translatesAutoresizingMaskIntoConstraints = false
        mainFatBoiStack.addArrangedSubview(sv4)
        //        view.addSubview(sv4)
        view.addSubview(mainFatBoiStack)
    }
    func constrainStackBoi(){
        mainFatBoiStack.translatesAutoresizingMaskIntoConstraints = false
        mainFatBoiStack.distribution = .equalCentering
        mainFatBoiStack.alignment = .fill
        mainFatBoiStack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 8).isActive = true
        mainFatBoiStack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8).isActive = true
        mainFatBoiStack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8).isActive = true
        mainFatBoiStack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -8).isActive = true
        mainFatBoiStack.heightAnchor.constraint(equalToConstant: (view.bounds.height/3)*2).isActive = true
        
        print(mainFatBoiStack.layer.cornerCurve,"froom")
    }
    
    //MARK: - properties
    var buttons: [[CalculatorButton]] = []
    var safeArea: UILayoutGuide{
        return self.view.safeAreaLayoutGuide
    }
    var mainFatBoiStack: UIStackView = UIStackView()
    var smallStackStrangeRow = UIStackView()
    var currentNumberString = ""{
        didSet{
            calcyLabel.text = currentNumberString
        }
    }
    var lastNumber: Double = 0.0
    var smallStackView7Row = UIStackView()
    var currentFunction = Function.manHasntDecidedYet
    var sampleButton: UIButton = UIButton()
    var smallStackView4Row = UIStackView()
    var calcyLabel: UILabel = UILabel()
    var imageView = UIImageView()
    var smallStackView1Row = UIStackView()
    var smallStackView0Row = UIStackView()
}
//MARK: - extensions
//the functions that make me want to die
extension MainViewController{
    
    func makeTopStack() ->UIStackView{
        let rowButtons = buttons[0]
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.heightAnchor.constraint(equalToConstant: mainFatBoiStack.bounds.height/5).isActive = true
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        
        for button in rowButtons{
            stack.addArrangedSubview(button)
        }
        return stack
    }
    func make7Stack() ->UIStackView{
        let rowButtons = buttons[1]
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        stack.distribution = .fillEqually
        
        for button in rowButtons{
            stack.addArrangedSubview(button)
        }
        return stack
    }
    func make4Stack()->UIStackView{
        let rowButtons = buttons[2]
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        stack.distribution = .fillEqually
        
        for button in rowButtons{
            stack.addArrangedSubview(button)
        }
        return stack
    }
    func make1Stack()->UIStackView{
        let rowButtons = buttons[3]
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        
        for button in rowButtons{
            stack.addArrangedSubview(button)
        }
        return stack
    }
    func make0Stack()->UIStackView{
        let rowButtons = buttons[4]
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.spacing = 8
        stack.distribution = .fill
        stack.heightAnchor.constraint(equalToConstant: mainFatBoiStack.bounds.height/5).isActive = true
        for button in rowButtons{
            stack.addArrangedSubview(button)
        }
        print(mainFatBoiStack.frame)
        
        return stack
    }
    func makeRow5(){
        var mutableButton: CalculatorButton = NumberButton()
        
        var row: [CalculatorButton] = [mutableButton]
        mutableButton.setText(text: "0")
        mutableButton.setFontAndConstraints()
        mutableButton.addTarget(self, action: #selector(numberButtonPressed(sender:)), for: .touchUpInside)
        mutableButton = NumberButton()
        mutableButton.setFontAndConstraints()
        mutableButton.setText(text: ".")
        mutableButton.addTarget(self, action: #selector(numberButtonPressed(sender:)), for: .touchUpInside)
        row.append(mutableButton)
        mutableButton = FunctionButton()
        mutableButton.setFontAndConstraints()
        mutableButton.setText(text: "=")
        mutableButton.addTarget(self, action: #selector(functionButtonPressed(sender:)), for: .touchUpInside)
        row.append(mutableButton)
        buttons.append(row)
    }
    func makeRow2(){
        var mutableButton: CalculatorButton = NumberButton()
        mutableButton.setFontAndConstraints()
        var row: [CalculatorButton] = [mutableButton]
        mutableButton.setText(text: "7")
        mutableButton.addTarget(self, action: #selector(numberButtonPressed(sender:)), for: .touchUpInside)
        mutableButton = NumberButton()
        mutableButton.setFontAndConstraints()
        mutableButton.setText(text: "8")
        mutableButton.addTarget(self, action: #selector(numberButtonPressed(sender:)), for: .touchUpInside)
        row.append(mutableButton)
        mutableButton = NumberButton()
        mutableButton.setFontAndConstraints()
        mutableButton.setText(text: "9")
        mutableButton.addTarget(self, action: #selector(numberButtonPressed(sender:)), for: .touchUpInside)
        row.append(mutableButton)
        mutableButton = FunctionButton()
        mutableButton.setFontAndConstraints()
        mutableButton.setText(text: "*")
        mutableButton.addTarget(self, action: #selector(functionButtonPressed(sender:)), for: .touchUpInside)
        row.append(mutableButton)
        buttons.append(row)
    }
    func makeRow3(){
        var mutableButton: CalculatorButton = NumberButton()
        mutableButton.setFontAndConstraints()
        mutableButton.addTarget(self, action: #selector(numberButtonPressed(sender:)), for: .touchUpInside)
        var row: [CalculatorButton] = [mutableButton]
        mutableButton.setText(text: "4")
        mutableButton.addTarget(self, action: #selector(numberButtonPressed(sender:)), for: .touchUpInside)
        mutableButton = NumberButton()
        mutableButton.setFontAndConstraints()
        mutableButton.setText(text: "5")
        mutableButton.addTarget(self, action: #selector(numberButtonPressed(sender:)), for: .touchUpInside)
        row.append(mutableButton)
        mutableButton = NumberButton()
        mutableButton.setFontAndConstraints()
        mutableButton.setText(text: "6")
        mutableButton.addTarget(self, action: #selector(numberButtonPressed(sender:)), for: .touchUpInside)
        row.append(mutableButton)
        mutableButton = FunctionButton()
        mutableButton.setFontAndConstraints()
        mutableButton.setText(text: "-")
        mutableButton.addTarget(self, action: #selector(functionButtonPressed(sender:)), for: .touchUpInside)
        row.append(mutableButton)
        buttons.append(row)
    }
    func makeRow4(){
        var mutableButton: CalculatorButton = NumberButton()
        mutableButton.setFontAndConstraints()
        mutableButton.addTarget(self, action: #selector(numberButtonPressed(sender:)), for: .touchUpInside)
        var row: [CalculatorButton] = [mutableButton]
        mutableButton.setText(text: "1")
        mutableButton.addTarget(self, action: #selector(functionButtonPressed(sender:)), for: .touchUpInside)
        mutableButton = NumberButton()
        mutableButton.setFontAndConstraints()
        mutableButton.setText(text: "2")
        mutableButton.addTarget(self, action: #selector(numberButtonPressed(sender:)), for: .touchUpInside)
        row.append(mutableButton)
        mutableButton = NumberButton()
        mutableButton.setFontAndConstraints()
        mutableButton.setText(text: "3")
        mutableButton.addTarget(self, action: #selector(numberButtonPressed(sender:)), for: .touchUpInside)
        row.append(mutableButton)
        mutableButton = FunctionButton()
        mutableButton.setFontAndConstraints()
        mutableButton.setText(text: "+")
        mutableButton.addTarget(self, action: #selector(functionButtonPressed(sender:)), for: .touchUpInside)
        row.append(mutableButton)
        buttons.append(row)
    }
    func makeRow1(){
        var mutableButton: CalculatorButton = StrangerButton()
        var row1: [CalculatorButton] = [mutableButton]
        mutableButton.setText(text: "AC")
        mutableButton.setFontAndConstraints()
        mutableButton.addTarget(self, action: #selector(strangerButtonPressed(sender :)), for: .touchUpInside)
        sampleButton = mutableButton
        mutableButton = StrangerButton()
        mutableButton.setText(text: "+-")
        mutableButton.setFontAndConstraints()
        mutableButton.addTarget(self, action: #selector(strangerButtonPressed( sender:)), for: .touchUpInside)
        row1.append(mutableButton)
        mutableButton = StrangerButton()
        mutableButton.setText(text: "%")
        mutableButton.setFontAndConstraints()
        mutableButton.addTarget(self, action: #selector(strangerButtonPressed( sender:)), for: .touchUpInside)
        row1.append(mutableButton)
        mutableButton = FunctionButton()
        mutableButton.setFontAndConstraints()
        mutableButton.setText(text: "÷")
        mutableButton.addTarget(self, action: #selector(functionButtonPressed(sender:)), for: .touchUpInside)
        row1.append(mutableButton)
        buttons.append(row1)
    }
}
//the actual functions to run the calculator. TO THINK THAT IT TOOK ME THREE ****ING HUNDRED AND NINE ****ING LINES OF CODE TO GET HERE
extension MainViewController{
    @objc func numberButtonPressed(sender: CalculatorButton){
        if(sender.titleLabel!.text!=="."){
            if(!currentNumberString.contains(".")){
                currentNumberString+="\(sender.titleLabel!.text!)"
            }
        }else{
            currentNumberString+="\(sender.titleLabel!.text!)"
        }
        pressAnimation(sender)
    }
    @objc func functionButtonPressed(sender: CalculatorButton){
        pressAnimation(sender)
        guard let number = Double(currentNumberString) else {return}
        switch sender.titleLabel!.text!{
        case "*":
            lastNumber = number
            currentFunction = .multiply
            currentNumberString = ""
        case "÷":
            lastNumber = number
            currentNumberString = ""
            currentFunction = .divide
        case "-":
            lastNumber = number
            currentNumberString = ""
            currentFunction = .subtract
        case "+":
            lastNumber = number
            currentNumberString = ""
            currentFunction = .add
        default:
            performMath()
        }
        
    }
    func makeMutaTalk(){
        UIView.transition(with: imageView, duration: 1.5, options: .transitionCrossDissolve, animations: {self.imageView.image = UIImage(named: "badmuta")}) { didIt in
            if didIt{
                UIView.transition(with: self.imageView, duration: 1.5, options: .transitionCrossDissolve, animations: {self.imageView.image = UIImage(named: "muta")}, completion: nil)
            }
        }
    }
    func performMath(){
        makeMutaTalk()
        guard let newNum = Double(currentNumberString), !(newNum == 0.0) else {return}
        var sum = 0.0
        switch currentFunction{
        case .add:
            sum = lastNumber+newNum
        case .divide:
            sum = lastNumber/newNum
        case .multiply:
            sum = lastNumber*newNum
        case .subtract:
            sum = lastNumber-newNum
        default:
            print("im not doing that")
            calcyLabel.text = currentNumberString
        }
        lastNumber = newNum
        currentNumberString = "\(sum)"
        
    }
    @objc func strangerButtonPressed(sender:CalculatorButton){
        pressAnimation(sender)
        switch sender.titleLabel!.text!{
        case "AC":
            guard let newnum = Double(currentNumberString) else {return}
            lastNumber = newnum
            currentNumberString = ""
            currentFunction = .manHasntDecidedYet
        case "+-":
            invert()
        default:
            print("")
        }
    }
    func pressAnimation(_ sender: CalculatorButton){
        UIView.animate(withDuration: 0.1) {
            sender.alpha = 0.5
        }
        UIView.animate(withDuration: 0.1) {
            sender.alpha = 1
        }

    }
    func invert(){
        var array = Array(currentNumberString)
        if(array[0]=="-"){
            array.remove(at: 0)
        }else{
            array.insert("-", at: 0)
        }
        var newBoy = ""
        for i in array{
            newBoy += String(i)
        }
        currentNumberString = newBoy
    }
}
