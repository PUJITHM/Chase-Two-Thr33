//
//  settingsviewcontroller.swift
//  Chase To thr33
//
//  Created by system11 on 28/01/17.
//  Copyright © 2017 system11. All rights reserved.
//

import UIKit
import AVFoundation

class settingsviewcontroller: UIViewController
{

    var audioplayer : AVAudioPlayer!
    
    
    @IBOutlet weak var switchlable: UISwitch!
    @IBAction func sounsetting(sender: UISwitch)
    {
        
        let userdefaults = NSUserDefaults()
        userdefaults.setBool(sender.on, forKey: "isaudioEnabled")
       let path = NSBundle.mainBundle().pathForResource("audi", ofType: "mp3")
        let url = NSURL(fileURLWithPath: path!)
        do
        {
            
        audioplayer =  try  AVAudioPlayer(contentsOfURL: url)
        }
        catch
        {
            
        }
        
        if sender.on
        {
                
                
                audioplayer.prepareToPlay()
                audioplayer.play()
            }
          
                    
    //if !(sender.on)
     else  {
            audioplayer.prepareToPlay()
            self.audioplayer.stop()
            
            
        }


    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        sounsetting(switchlable)
        // Do any additional setup after loading the view.
    }
    
   
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
