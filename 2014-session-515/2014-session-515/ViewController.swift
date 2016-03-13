//
//  ViewController.swift
//  2014-session-515
//
//  Created by 宋宋 on 16/3/11.
//  Copyright © 2016年 DianQK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        firstImageView.image = UIImage(named: "white")
//        swapRedGreen()
        vignetteEffect()
//        sourceOver()
//        mirrorX()
        
//        motionBlurX()
    }
    
    func swapRedGreen() {
        let swap = SwapRedGreenFilter()
        swap.inputAmout = 0.8
        swap.inputImage = CIImage(image: firstImageView.image!)
        
        secondImageView.image = UIImage(CIImage: swap.outputImage!, scale: 2.0, orientation: .Up)
        //        secondImageView.contentMode = .ScaleToFill
    }
    
    func vignetteEffect() {
        let vignetteEffect = VignetteEffectFilter()
        vignetteEffect.inputImage = CIImage(image: firstImageView.image!)
        print(secondImageView.image?.size)
        secondImageView.image = UIImage(CIImage: vignetteEffect.outputImage!, scale: 2.0, orientation: .Up)
        print(secondImageView.image?.size)
    }
    
    func sourceOver() {
        let sourceOverFilter = SourceOverFilter()
        sourceOverFilter.inputImage = CIImage(image: firstImageView.image!)
        sourceOverFilter.inputBackgroundImage = CIImage(image: UIImage(named: "white")!)

        secondImageView.image = UIImage(CIImage: sourceOverFilter.outputImage!, scale: 2.0, orientation: .Up)
    }
    
    func mirrorX() {
        let mirrorX = MirrorXFilter()
        mirrorX.inputImage = CIImage(image: firstImageView.image!)
        secondImageView.image = UIImage(CIImage: mirrorX.outputImage!, scale: 2.0, orientation: .Up)
    }
    
    func motionBlurX() {
        let blurX = MotionBlurFilter()
        blurX.inputImage = CIImage(image: firstImageView.image!)
        secondImageView.image = UIImage(CIImage: blurX.outputImage!, scale: 2.0, orientation: .Up)
    }
    
}
