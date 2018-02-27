//
//  mainViewController.swift
//  Chase To thr33
//
//  Created by system11 on 30/01/17.
//  Copyright © 2017 system11. All rights reserved.
//

import UIKit

class mainViewController: UIViewController
{
    let singlemultiple = NSUserDefaults()

    
    @IBAction func single(sender: AnyObject)
    {
            singlemultiple.setBool(false, forKey: "ms")
    }
    @IBAction func double(sender: AnyObject)
    {
        singlemultiple.setBool(true, forKey: "ms")
    }

    override func viewDidLoad()
    {
        
        super.viewDidLoad()
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
