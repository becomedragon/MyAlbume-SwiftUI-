//
//  PhotoAssetsModel.swift
//  MyAlbume
//
//  Created by 程晓龙 on 2019/8/13.
//  Copyright © 2019 程晓龙. All rights reserved.
//

import SwiftUI
import Photos
import Combine

struct PhotoAsset:Hashable, Identifiable {
    var id: String
    var asset:PHAsset
}

final class PhotoAssetsModel:BindableObject {
    var didChange = PassthroughSubject<[PhotoAsset]?,Never>()
    var photos:[PhotoAsset]? {
        didSet {
            self.didChange.send(self.photos)
        }
    }
    
    init(collection:PHAssetCollection) {
        fetch(collection: collection)
    }
    
    func fetch(collection:PHAssetCollection) {
        let options = PHFetchOptions()
        let fetchResult = PHAsset.fetchKeyAssets(in: collection, options: options)
        var assets = [PhotoAsset]()
        for idx in 0 ..< (fetchResult?.count ?? 0) {
            let ass = fetchResult![idx]
            let model = PhotoAsset(id: ass.localIdentifier, asset: ass)
            assets.append(model)
        }
        photos = assets
    }
}

final class PhotoImage:BindableObject {
    var didChange = PassthroughSubject<UIImage,Never>()
    var image:UIImage? {
        didSet {
            self.didChange.send(self.image!)
        }
    }
    
    init(asset:PHAsset) {
        PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: 50, height: 50), contentMode: .aspectFill, options: nil) { (image, info) in
            self.image = image
        }
    }
}

