//
//  ViewController.swift
//  Chase To thr33
//
//  Created by system11 on 13/01/17.
//  Copyright © 2017 system11. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController
{
    
    
    
    var winpos =
    [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]
    ]
    var movpos =
    [
        [2,5,4],
        [1,3,5],
        [2,5,6],
        [1,5,7],
        [1,2,3,4,6,7,8,9],
        [3,5,9],
        [4,5,8],
        [7,5,9],
        [8,5,6]
    ]
    var i = -1
    @IBOutlet weak var pa: UIButton!
    var j=0
    var ai=1
    var aiflag = 1
    var restriction = true
    var timer :NSTimer?
    var x = 0
    var block = false
    var pos=0
    var win = 0
    var first=0
    var second=0
    var audioplayer : AVAudioPlayer!

    var team = [
                [0,0,0],
                [0,0,0]
               ]
    let r:[String]=["🐼","🐷"]
    var showcoins = [["⭐️","⭐️","⭐️"],["⭐️","⭐️","⭐️"]]
    var ins = 0
    var c=0
    @IBOutlet weak var lwin: UILabel!
   
    
    @IBOutlet weak var lable: UIImageView!
    
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l4: UILabel!
   
    @IBOutlet weak var l5: UILabel!
    @IBOutlet weak var cc: UILabel!
    @IBOutlet weak var s: UILabel!
    @IBOutlet weak var f: UILabel!
    
       @IBOutlet weak var l6: UILabel!
    @IBOutlet weak var l7: UILabel!
    @IBOutlet weak var l8: UILabel!
    @IBOutlet weak var l9: UILabel!
    @IBOutlet weak var c1: UILabel!
    @IBOutlet weak var c2: UILabel!
   
  
   
     @IBAction func playagain(sender: AnyObject)
    {
       let arr=self.navigationController?.childViewControllers
        self.navigationController?.popToViewController(arr![0], animated: true)
    }

    
    
    @IBAction func b1(sender: UIButton)
    {
        if(win==0)
        {
        pos=1
            bfun(pos)

        }
    }
   
    
    @IBAction func b2(sender: UIButton)
    {
     
        if(win==0)
        {
        pos=2
            bfun(pos)
        }
        
    }
    @IBAction func b3(sender: UIButton)
    {
        if(win==0)
        {
            pos=3
            bfun(pos)
        }

    }
    @IBAction func b4(sender: UIButton)
    {
        if(win==0)
        {
        pos=4
            bfun(pos)
        }

    }
    @IBAction func b5(sender: UIButton)
    {
        if(win==0)
        {
        pos=5
            bfun(pos)
        }

    }
    
    @IBAction func b6(sender: UIButton)
    {
        if(win==0)
        {
        pos=6
            bfun(pos)
        }

    }
    

    @IBAction func b7(sender: UIButton)
    {
        if(win==0)
        {
        pos=7
            bfun(pos)
        }

    }
    @IBAction func b8(sender: UIButton)
    {
        if(win==0)
        {
        pos=8
            bfun(pos)
        }

    }
    @IBAction func b9(sender: AnyObject)
    {
        if(win==0)
        {
        pos=9
            bfun(pos)
        }

    }
    
    
    func changelable(var pos:Int,coin:String)
    {
        switch(pos)
        {
        case 1: l1.text=coin
        case 2: l2.text=coin
        case 3: l3.text=coin
        case 4: l4.text=coin
        case 5: l5.text=coin
        case 6: l6.text=coin
        case 7: l7.text=coin
        case 8: l8.text=coin
        case 9: l9.text=coin
        default: pos=0
            
        }
    }
    
    func bfun(pos:Int)
    {
        if (ins==0)
        {
           
            if(chechpos(pos)==1)
            {
                insert(pos)
            }
        }
        else
        {
            aftins(pos)
        }
        
    }
    
    
    
    
    
    
    func insert(pos:Int)
    {
        if(c==0)
            {
                i=i+1
            }
            team[c][i] = pos
        if (c==1 && i==2)
            {
                ins=1
            }
        changelable(pos, coin: r[(c)%2])
        if(c==1)
        {
            showcoins[c][i]=r[c]
            s.text = String(showcoins[c][0]+showcoins[c][1]+showcoins[c][2])
        }
        else
        {
            showcoins[c][i]=r[c]
            f.text = String(showcoins[c][0]+showcoins[c][1]+showcoins[c][2])
        }
        
        if(checkwin(c,team:team))
        {
            windec(c)
        }

        c=(c+1)%2
        cc.text = r[c]
        if (ai==1)
        {
            if(c==1)
            {
                
                timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: "aiins", userInfo: nil, repeats: false)
            }
        }
    }
    
    func chechpos(pos:Int) ->Int
    {
        for row in 0..<team.count
        {
            for col in 0..<team[row].count
            {
                if(pos==team[row][col])
                {
                    
                    return 0
                }
                
            }
        }
        return 1
    }
    
    
    func checkwin(c:Int,team:[[Int]])->BooleanType
    {
        var count=0
        for row in 0..<winpos.count
        {
            count=0
            for col in 0..<winpos[row].count
            {
                for tcol in 0...2
                {
                    if (winpos[row][col]==team[c][tcol])
                    {
                        count++
                        if(count==3)
                        {
                            return true
                        }
                    }
                    
                }
                
            }
        }

        
        return false
        
    }
    
    
    
    func aftins(pos:Int)
    {
        if(checkrow(pos)==1)
        {
            
            if(checkrow(pos)==1)
            {
                first=pos
                            }

            
        }
        else
        if(first>0)
        {
             second=pos
            if(chechpos(pos)==1 && checkmovs(first, second: second)==1)
            {
                
               
                swap()
                if(checkwin((c+1)%2,team: team))
                {
                    windec((c+1)%2)
                }
                if (ai==1 && win==0)
                {
                    if(c==1)
                    {
                        
                        timer?.invalidate()
                        timer = nil

                        timer =  NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: "aiaftins", userInfo: nil, repeats: false)
                        //aiaftins()
                    }
                }

                
            }
        }
    }
    
    
    func swap()
    {
        if (ai==1 && win==0)
        {
            if(c==1)
            {
                // sleep(1)
            }
        }

        print(first,second,r[c])
        var s1 = -1
        for col in 0..<team[c].count
        {
            if (Int(team[c][col]) == Int(first))
            {
                s1 = col
                
            }
        }
        team[c][s1]=second
        changelable(first, coin: "")
        changelable(second, coin: r[(c)%2])
        c=(c+1)%2
        cc.text=r[c]
        first = 0
        second = 0
            

            
    }
    func check()
    
    {
        c1.text=String(team[0][0])+String(team[0][1])+String(team[0][2])
        c2.text=String(team[1][0])+String(team[1][1])+String(team[1][2])
        f.text=String(first)
        s.text=String(second)
        cc.text=String(c)
    

    }
    
    
    
    
    
    func checkrow(pos:Int)->Int
    {
        for col in 0...2
        {
            if (pos==team[c][col])
            {
            return 1
            
            }
        }
        return 0
        
    }
    
    func checkmovs(first:Int,second:Int)->Int
    {
        if !(restriction)
        {
            return 1
        }
        for col in 0..<movpos[first-1].count
        {
            if(movpos[first-1][col]==second)
            {
                return 1
            }
        }
        return 0
    }
    
    
    
    func aiins()
    {
        
        timer?.invalidate()
        timer = nil
        if (aiflag==1)
        {
            aiflag = firstpos()
        }
        else if (aiflag==2)
        {
            aiflag=secondpos()
        }else if (aiflag==3)
        {
            thirdpos()
        }
        
        
    }
    func firstpos()->Int
    {
        while(true)
        {
            x = randomfun(8)
            var flag = true
            for col in winpos[x]
            {
                if (col==team[(c+1)%2][0])
                {
                    flag = false
                }
            }
            if flag
            {
                bfun(winpos[x][1])
                return 2

            }
        }
        
    }
    
    
    
    func secondpos()->Int
    {
        var tempteam = [
            [0,0,0],
            [0,0,0]
        ]
        tempteam=team
        for col in 1...9
        {
            if(chechpos(col)==1)
            {

            tempteam[0][2]=col
            if checkwin(0,team: tempteam)
            {
                bfun(col)
                block = true
                return 3
            }
            }
        }
        if(chechpos(winpos[x][1])==1)
            {
                bfun(winpos[x][0])

             }
        else
        {
            var xq=1
            while (true)
            {
                
                xq = randomfun(9)+1
                if(chechpos(xq)==1)
                {
                    bfun(xq)
                    break
                }
            }

        }
        return 3
    }
    
    
    
   func thirdpos()->BooleanType
   {
    if (block)
    {
        var tempteam = [
            [0,0,0],
            [0,0,0]
        ]
        tempteam=team
        for col in 1...9
        {
            if(chechpos(col)==1)
            {
                
                tempteam[1][2]=col
                if checkwin(1,team: tempteam)
                {
                    bfun(col)
                    block = true
                   return true
                }
            }
        }


        
    }
    
    //block next move
    var temp1=0
    var temp2=0
    (temp1,temp2)=moviswinpos((c+1)%2)
    if(chechpos(temp2)==1 && temp2>0)
    {

         bfun(temp2)
        return true
    }
    
    if(chechpos(winpos[x][2])==1)
    {
       
        bfun(winpos[x][2])
        
    }
    else
    {
        var xq=1
        while (true)
        {
            
            xq = randomfun(9)+1
            if(chechpos(xq)==1)
            {
                bfun(xq)
                break
            }
        }
        
    }
    return true

   }
    
    
    func aiaftins()
    {
        timer?.invalidate()
        timer = nil

        if (c==1)
        {
       
        var f=0
        var s=0
        (first,second)=moviswinpos(c)
        if(first>0 && second>0)
        {
            swap()
            print("my win pos")
            
            if(checkwin((c+1)%2,team: team))
            {
                windec((c+1)%2)
                return
            }
            
        }
        
        //predect openent move
        
        (f,s)=moviswinpos((c+1)%2)
        for row in 0...2
        {
            if (checkmovs(team[c][row], second: s)==1 && chechpos(s)==1 && s>0)
            {
                first=team[c][row]
                second=s
                swap()
                print("predect openent move")
                if(checkwin((c+1)%2,team: team))
                {
                    windec((c+1)%2)
                    return
                }
                

                
            }
        }
        
        // default move
        if (c==1)
        {
        var a1=[Int]()
        var a2=[Int]()
        for i in 1...9
        {
            if (chechpos(i)==1)
            {
                for row in 0..<team[c].count
                {
                    if (checkmovs(team[c][row], second: i)==1)
                    {
                        a1.append(team[c][row])
                        a2.append(i)
                    }
                }
            }
            
        }
        print(a1,a2)
        let x=randomfun(a1.count)
        print(x+1)
        first=a1[x]
        second=a2[x]
        swap()
        print("default")
        if(checkwin((c+1)%2,team: team))
        {
            windec((c+1)%2)
            return
        }
            }

        
        }
        
       
        
        
    }
    func moviswinpos(c:Int)->(min:Int,max:Int)
    {
         for row in 0...2
         {
        for col in 1...9
        {
            if(chechpos(col)==1)
            {
                
            if (checkmovs(team[c][row], second: col)==1)
            {
            var tempteam=team
            tempteam[c][row]=col
            if checkwin(c, team: tempteam)
            {
                return (team[c][row],col)
                
                }}
            
            }
        }
        }
        return (0,0)
    }
    
    
    
    func blinkcoins(var c:Int)
    {
        for xv in 0...4
        {
        for i in 0...2
        {
            print(team[c][i])
            changelable(team[c][i], coin: "")
        }
        sleep(1)
            for i in 0...2
            {
                changelable(team[c][i], coin: r[c])
            }

        }
        
        
    }
    
    
    func randomfun(mmax:Int)->Int
    {
        let rand = Int(arc4random_uniform(UInt32(mmax)))
        
        return rand
        
    }
    func windec(c:Int)
    {
        lwin.text = r[c]+" wins "
        pa.hidden=false
        s.hidden=true
        f.hidden=true
        cc.hidden=true
        c1.hidden=true
        c2.hidden=true
        
        win=1
        var bounds = self.lable.bounds
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: .CurveEaseOut, animations: {
            self.lable.bounds = CGRect(x: bounds.origin.x, y:  bounds.origin.y, width: bounds.size.width + 10, height: bounds.size.height)
        
                        }, completion: nil)
        
        bounds = self.lwin.bounds
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: .CurveEaseOut, animations: {
            self.lwin.bounds = CGRect(x: bounds.origin.x, y:  bounds.origin.y, width: bounds.size.width + 10, height: bounds.size.height)
            
            }, completion: nil)
        bounds = self.pa.bounds
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: .CurveEaseOut, animations: {
            self.pa.bounds = CGRect(x: bounds.origin.x, y:  bounds.origin.y, width: bounds.size.width + 10, height: bounds.size.height)
            
            }, completion: nil)
        
    }
    
    
    
    
    
    
 
     override func viewDidLoad()
    {
        f.text="⭐️⭐️⭐️"
        s.text="⭐️⭐️⭐️"
        cc.text = r[c]
        super.viewDidLoad()
        
                
        
        
        
        let path = NSBundle.mainBundle().pathForResource("audi", ofType: "mp3")
        let url = NSURL(fileURLWithPath: path!)
        do
        {
            
            audioplayer =  try  AVAudioPlayer(contentsOfURL: url)
        }
        catch
        {
            
        }

        let singlemultiple = NSUserDefaults()
        let mult = singlemultiple.valueForKey("ms") as? Bool
        if mult == false
        {
            ai = 1
        }
        else
        {
            ai = 0
        }
        
        
        
        
        
        
        let userdefaults = NSUserDefaults()
        let isenabled = userdefaults.valueForKey("isaudioEnabled")  as? Bool
        if isenabled == true
        {
            
            audioplayer.prepareToPlay()
            audioplayer.play()

        }
        else
        
        {
            audioplayer.prepareToPlay()
            self.audioplayer.stop()

        }
                pa.hidden=true
        
       
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

