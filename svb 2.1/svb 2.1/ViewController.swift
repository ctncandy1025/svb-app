//
//  ViewController.swift
//  svb 2.1
//
//  Created by rhea sharma on 8/2/18.
//  Copyright © 2018 rhea sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var filteredImage:UIImage?
    
  @IBOutlet var imageview: UIImageView!
  @IBOutlet var showimage: UIButton!
  @IBAction func showfilteredimage(sender: UIButton) {
    if showimage.selected {
        let image = UIImage(named: "sunshine")
        imageview.image = image
        showimage.selected = false
    }
    else{
            imageview.image = filteredImage
            showimage.selected = true
    }
}
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        showimage.setTitle("Show Before Image", forState: .Selected)

        let image = UIImage(named: "sunshine")!
        
        var rgbaImage = RGBAImage(image:  image)!
        
        
        let avgRed = 107

        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                
                var pixel = rgbaImage.pixels[index]
                
                let redDelta = Int(pixel.red) - avgRed
                
                  var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                  if (Int(pixel.red) < avgRed){
                        print("Red value is " + String(  pixel.red))
                          modifier = 1
                    }
                
                     pixel.red = UInt8(max(min(255,Int(round(
                         Double(avgRed) + Double(modifier) * Double(redDelta)))), 0))
                            rgbaImage.pixels[index] = pixel
                            }
                        }
        filteredImage = rgbaImage.toUIImage()
        
                
            }
            
    override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
            }
            
            
}

