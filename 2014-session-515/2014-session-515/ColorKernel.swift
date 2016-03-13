//
//  ColorKernel.swift
//  2014-session-515
//
//  Created by 宋宋 on 16/3/13.
//  Copyright © 2016年 DianQK. All rights reserved.
//

import UIKit

class SwapRedGreenFilter: CIFilter {
    
    var inputImage: CIImage?
    
    var inputAmout: Float?
    
    override var outputImage: CIImage? {
        guard let dod = inputImage?.extent else { return nil }
        
        return MyKernel.sharedInstance.kernel.applyWithExtent(dod, arguments: [inputImage!, inputAmout!])
    }
    
    class MyKernel {
        
        let kernel: CIColorKernel
        
        static let sharedInstance = MyKernel()
        private init() {
            kernel = CIColorKernel(string: "kernel vec4 swapRedandGreenAmount ( __sample s, float amount ) { return mix(s.rgba, s.grba, amount); }")!
        }
    }
    
}

class VignetteEffectFilter: CIFilter {
    
    var inputImage: CIImage?
    
    override var outputImage: CIImage? {
        guard let dod = inputImage?.extent else { return nil }
        let radius: Float = Float(0.5 * hypot(dod.size.width, dod.size.height))
        let centerOffset = CIVector(x: dod.size.width * 0.5 + dod.origin.x, y: dod.size.height * 0.5 + dod.origin.y)
        
        return MyKernel.sharedInstance.kernel.applyWithExtent(dod, arguments: [inputImage!, centerOffset, radius])
    }
    
    class MyKernel {
        
        let kernel: CIColorKernel
        
        static let sharedInstance = MyKernel()
        private init() {
            kernel = CIColorKernel(string: "kernel vec4 vignette ( __sample s, vec2 centerOffset, float radius ) { vec2 vecFromCenter = destCoord () - centerOffset; float distance = length ( vecFromCenter ); float darken = 1.0 - ( distance / radius ); return vec4( s.rgb * darken, s.a ); }")!
        }
    }
    
}

class SourceOverFilter: CIFilter {
    
    var inputImage: CIImage?
    
    var inputBackgroundImage: CIImage?
    
    override var outputImage: CIImage? {
        guard let inputExtent = inputImage?.extent
            , inputBackgroundExtent = inputBackgroundImage?.extent
            else { return nil }
        let dod = CGRectUnion(inputExtent, inputBackgroundExtent)
        
        return MyKernel.sharedInstance.kernel.applyWithExtent(dod, arguments: [inputImage!, inputBackgroundImage!])
    }
    
    class MyKernel {
        
        let kernel: CIColorKernel
        
        static let sharedInstance = MyKernel()
        private init() {
            kernel = CIColorKernel(string: "kernel vec4 sourceOver( __sample src, __sample dest ) { return src + (1.0-src.a)*dest; }")!
        }
    }
}