//
//  WarpKernel.swift
//  2014-session-515
//
//  Created by 宋宋 on 16/3/13.
//  Copyright © 2016年 DianQK. All rights reserved.
//

import UIKit

class MirrorXFilter: CIFilter {
    
    var inputImage: CIImage?
    
    override var outputImage: CIImage? {
        guard let inputImage = inputImage else { return nil }
        let inputWidth = Float(inputImage.extent.size.width)
        return MyKernel.sharedInstance.kernel.applyWithExtent(inputImage.extent, roiCallback: { (v, rc) -> CGRect in
            return rc
            }, inputImage: inputImage, arguments: [inputWidth])
    }
    
    class MyKernel {
        
        let kernel: CIWarpKernel
        
        static let sharedInstance = MyKernel()
        private init() {
            kernel = CIWarpKernel(string: "kernel vec2 mirrorX ( float imageWidth ) { return vec2 (imageWidth - destCoord().x,destCoord().y); }")!
            // 并不知道为什么 kernel vec2 mirrorX ( float imageWidth ) {
            //            vec2 input = destCoord();
            //            return vec2 ( imageWidth - input.x , input.y );
            //        } 就不行 ==
        }
    }
}

class AnamorphicStretchFilter: CIFilter {
    
    var inputImage: CIImage?
    
    override var outputImage: CIImage? {
        guard let inputImage = inputImage else { return nil }
        let inputWidth = Float(inputImage.extent.size.width)
        return MyKernel.sharedInstance.kernel.applyWithExtent(inputImage.extent, roiCallback: { (v, rc) -> CGRect in
            return rc
            }, inputImage: inputImage, arguments: [inputWidth])
    }
    
    class MyKernel {
        
        let kernel: CIWarpKernel
        
        static let sharedInstance = MyKernel()
        private init() {
            kernel = CIWarpKernel(string: "kernel vec2 mirrorX ( float imageWidth ) { return vec2 (imageWidth - destCoord().x,destCoord().y); }")!
            // 并不知道为什么 kernel vec2 mirrorX ( float imageWidth ) {
            //            vec2 input = destCoord();
            //            return vec2 ( imageWidth - input.x , input.y );
            //        } 就不行 ==
        }
    }
    
}