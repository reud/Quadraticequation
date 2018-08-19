//
//  Fraction.swift
//  Quadraticequation
//
//  
//  Copyright © 2018年 reud. All rights reserved.
//

import Foundation
import UIKit

class Fraction{
    var child:Int=0
    var mother:Int=0
    var number:Double=0
    var Imp:Bool=true
    //約分前
    var fixedChild:Int=0
    var fixedMother:Int=0
    func checkRecurring(x:Double)->(Bool,Int,Int)
    {
        var count:Int=0
        let limit:Int=10
        var cx=x
        //未約分分数
        var fixedChiled2:Int
        var fixedMother2:Int
        while(count<limit)
        {
            let intNum=floor(cx)
            if( (intNum-cx)==0 )
            {
                fixedChiled2=Int(intNum)
                return (false,fixedChiled2,NSDecimalNumber(decimal: pow(10,count)).intValue)
            }
            count=count+1
            cx = cx*10
        }
        //ここから先は循環小数について
        count=1
        cx=x
        while count<limit {
            let bigNum:Double=cx * Double(NSDecimalNumber(decimal: pow(10,count)).intValue)
            print("\(bigNum)is bignum \(cx) is cx")
            if(checkInteger(number: bigNum-cx))
            {
                fixedMother2=NSDecimalNumber(decimal: pow(10,count)).intValue-1
                fixedChiled2=Int(bigNum)-Int(cx)
                return(true,fixedChiled2,fixedMother2)
            }
            count = count + 1
        }
        return(true,0,0)
    }
    func outputCharacter()->String
    {
        if(self.Imp)
        {
            return String(self.number)
        }
        else if(self.mother==1)
        {
            return String(self.child)
        }
        else
        {
            return "\(self.child)/\(self.mother)"
        }
    }
    init(number:Double)
    {
        self.number=number
        self.fixedChild=checkRecurring(x: number).1
        self.fixedMother=checkRecurring(x: number).2
        //約分(絶対値にしておく)
        guard !(self.fixedMother==0) else
        {
            return
        }
        let maxg=gcd(x: abs(self.fixedChild), y: abs(self.fixedMother))
        self.child=self.fixedChild/maxg
        self.mother=self.fixedMother/maxg
        self.Imp=false
    }
    func gcd(x:Int, y:Int) -> Int {
        if(x<y){
            return gcd(x:y,y:x)
        }
        var xt=x
        var yt=y
        while(yt != 0){
            let rm=xt%yt
            xt=yt
            yt=rm
            
        }
        print("\(x) and \(y) gcd is \(xt)")
        return xt
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
}
