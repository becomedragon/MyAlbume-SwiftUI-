//
//  PhotoCollectionModel.swift
//  MyAlbume
//
//  Created by 程晓龙 on 2019/8/13.
//  Copyright © 2019 程晓龙. All rights reserved.
//
import SwiftUI
import Photos
import Combine

struct CollectionModel:Hashable, Identifiable {
    var id:Int
    var name:String
    var identifier:String
    var collection:PHAssetCollection
}

final class PhotoCollectionModel:BindableObject {
    
    var didChange = PassthroughSubject<[CollectionModel]?, Never>()
    
    var photoCollections:[CollectionModel]? {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self.photoCollections)
            }
        }
    }
    
    init() {
        fetchAll()
    }
    
    func fetchAll() {
        let options = PHFetchOptions()
        let fetchRecult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: options)
        
        var collectionList = [CollectionModel]()
        for idx in 0 ..< fetchRecult.count {
            let collection = fetchRecult[idx]
            let name = collection.localizedTitle!
            let identifier = collection.localIdentifier
            let model = CollectionModel(id: idx, name: name, identifier: identifier,collection: collection)
            collectionList.append(model)
        }
        photoCollections = collectionList
    }
    
}

