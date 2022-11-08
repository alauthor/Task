//
//  UIImageView+Designable.swift
//  Test
//
//  Created by admin on 4/16/20.
//  Copyright © 2020 testing. All rights reserved.
//

import UIKit
import Photos
import Kingfisher

extension UIImageView {
    
    
    /**
     *** 1- content mode
     */
    
    
    /**
     *******
     * ------- FOR FASTER USER ------------
     *
     .set(rounded: true)
     .claer()
     *
     *******
     */
    
    /**
     *******
     * ------- FOR FASTER USER ------------
     *
     .set(rounded: true)
     .claer()
     *
     *******
     */
    
    static func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: 1024.0, height: 712.0), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }
    
    
    /**
     *** mark:- set imageView content mode easily
     *--------------------------------------------------------
     *&&-------
     *&& set content mode
     *&&-----
     *--------------------------------------------------------
     */
    
    internal func set(contentMode: UIImageView.ContentMode) -> UIImageView {
        self.contentMode = contentMode
        return self
    }
    
    /**
     *** mark:- set imageView content mode easily
     *--------------------------------------------------------
     *&&-------
     *&& set custom image in case the URL does not working
     *&&-----
     *--------------------------------------------------------
     */
    
    internal func loadImage(url: URL?, first letter: String = "")
    {
        
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url) { [weak self] (result) in
            guard let self = self else { return }
            if let image = try? result.get().image {
                self.contentMode = .scaleAspectFit
                self.image = image
                return
            }
            self.image = self.createCustomImage(with: letter)
        }
    }
    
    private func createCustomImage(with name: String = "") -> UIImage? {
        let frame = self.frame
        let nameLabel = UILabel(frame: frame)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .lightGray
        nameLabel.textColor = .white
        nameLabel.text = name
        UIGraphicsBeginImageContext(frame.size)
        if let currentContext = UIGraphicsGetCurrentContext() {
            nameLabel.layer.render(in: currentContext)
            let nameImage = UIGraphicsGetImageFromCurrentImageContext()
            return nameImage
          }
        return nil
    }
    
}
