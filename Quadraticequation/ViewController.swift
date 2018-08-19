//
//  ViewController.swift
//  Quadraticequation
//
//  
//  Copyright © 2018年 reud. All rights reserved.
//

import UIKit
var A:Int=0
var B:Int=0
var C:Int=0
var D:Int=0
var showIN:Bool=false
var sign2OnPlus:Bool=true
var sign3OnPlus:Bool=false
class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        a.keyboardType=UIKeyboardType.numberPad
        b.keyboardType=UIKeyboardType.numberPad
        c.keyboardType=UIKeyboardType.numberPad
        AnserLine.adjustsFontSizeToFitWidth = true
        AnserLine.text="さぁ始めよう！"
        print("kidou")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushedCalc(_ sender: Any) {
        let buttonState={(button:UIButton)->Int in
            if(button.currentTitle=="+")
            {
                return 1
            }
            else if(button.currentTitle=="-")
            {
                return -1
            }
            else
            {
                return 0
            }
            
        }
        A=Int(a.text!) ?? 0
        B=Int(b.text!) ?? 0
        C=Int(c.text!) ?? 0
        B = B*buttonState(sign2)
        C = C*buttonState(sign3)
        print("\(A) and \(B) and \(C)")
        guard A != 0 else {
            
            AnserLine.text="二次方程式になりません。"
            return
        }
        D=B*B-4*A*C
        if(showIN==false)
        {
            guard D>0 else{
                print("no answer D=\(D)")
                AnserLine.text="実数解なし"
                return
            }
        }
        print("count is \(Caliculation(A,B,C).count)")
        if(Caliculation(A,B,C).count==1)
        {
            let ans1=Fraction(number:Caliculation(A,B,C)[0]).outputCharacter()
            AnserLine.text="x=\(ans1)"
        }
        else if(Caliculation(A, B, C).count==2)
        {
            print("Now in 2")
            AnserLine.text="x=\(Fraction(number:Caliculation(A,B,C)[0]).outputCharacter()),\(Fraction(number:Caliculation(A,B,C)[1]).outputCharacter())"
        }
        
        
    }
    func checkInteger(number: Double)->Bool{
        let intNum=floor(number)
        if( (intNum-number)==0 )
        {
            return true
        }
        else{
            return false
        }
    }
    @IBAction func changeSign3(_ sender: Any) {
        sign3OnPlus = !sign3OnPlus
        if(sign3OnPlus)
        {
            sign3.setTitle("+", for: .normal)
        }
        else
        {
            sign3.setTitle("-", for: .normal)
        }
    }
    @IBAction func changesign2(_ sender: Any) {
        sign2OnPlus = !sign2OnPlus
        if(sign2OnPlus)
        {
            sign2.setTitle("+", for: .normal)
        }
        else
        {
            sign2.setTitle("-", for: .normal)
        }
    }
    @IBOutlet weak var showINButton: UIButton!
    @IBOutlet weak var AnserLine: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var c: UITextField!
    @IBOutlet weak var b: UITextField!
    
    @IBOutlet weak var sign3: UIButton!
    @IBOutlet weak var sign2: UIButton!
    
    func Caliculation(_ ai:Int,_ bi:Int,_ ci:Int)->Array<Double>
    {
        let di=bi*bi-4*ai*ci
        print("Calc:di=\(di)")
        if(di==0)
        {
            
            return [-1*Double(bi)/Double(2*ai)]
        }
        else if(di<0)
        {
            return []
        }
        let ans1:Double=(-1*Double(bi)+sqrt(Double(di)))/Double((2*ai))
        let ans2:Double=(-1*Double(bi)-sqrt(Double(di)))/Double((2*ai))
        print("raw answer is \(ans1) and \(ans2)")
        return [ans1,ans2]
    }

}


