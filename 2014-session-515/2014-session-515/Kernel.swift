//
//  Kernel.swift
//  2014-session-515
//
//  Created by 宋宋 on 16/3/13.
//  Copyright © 2016年 DianQK. All rights reserved.
//

import UIKit


class MotionBlurFilter: CIFilter {
    
    var inputImage: CIImage?
    
    var inputRadius: CGFloat = 40
    
    var inputAngle: CGFloat = CGFloat(M_PI_2)
    
    var numSamples: Int = 0
    
    override var outputImage: CIImage? {
        guard let inputImage = inputImage else { return nil }
        let velocity = CIVector(x: inputRadius*cos(inputAngle), y: inputRadius*sin(inputAngle))
        
        func regionOf(rect: CGRect, velocity: CIVector) -> CGRect {
            return CGRectInset(rect, -abs(velocity.X), -abs(velocity.Y))
        }
        
        let DOD = regionOf(inputImage.extent, velocity: velocity)
        
        return MyKernel.sharedInstance.kernel.applyWithExtent(DOD, roiCallback: { (index, rect) -> CGRect in
            return regionOf(rect, velocity: velocity)
            }, arguments: [inputImage, velocity, numSamples])
    }
    
    class MyKernel {
        
        let kernel: CIKernel
        
        static let sharedInstance = MyKernel()
        private init() {
            kernel = CIKernel(string: "kernel vec4 motionBlur(sampler image, vec2 velocity, float numSamplesInput) { int numSamples = int(floor(numSamplesInput)); vec4 sum = vec4(0.0), avg = vec4(0.0); vec2 dc = destCoord(), offset = -velocity; for (int i=0; i < (numSamples * 2 + 1); i++) { sum += sample (image, samplerTransform (image, dc + offset)); offset += velocity / float(numSamples); } avg = sum / float((numSamples * 2 + 1)); return avg; }")!
        }
    }
    
}