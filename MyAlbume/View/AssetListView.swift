//
//  AlbumDetailView.swift
//  MyAlbume
//
//  Created by 程晓龙 on 2019/8/14.
//  Copyright © 2019 程晓龙. All rights reserved.
//

import SwiftUI
import Photos

struct AssetListView : View {
    var collection:CollectionModel
    
    var assets:PhotoAssetsModel {
        PhotoAssetsModel(collection: collection.collection)
    }
    
    var body: some View {
        Group {
            if (assets.photos == nil) {
                Text("Loading...")
            } else {
                List(assets.photos!){ item in
                    AssetItemView(asset: item)
                }
            }
        }
        
    }
}

#if DEBUG
struct AlbumDetailView_Previews : PreviewProvider {
    static var previews: some View {
        AssetListView(collection: CollectionModel(id: 0, name: "123", identifier: "123", collection: PHAssetCollection()))
    }
}
#endif
