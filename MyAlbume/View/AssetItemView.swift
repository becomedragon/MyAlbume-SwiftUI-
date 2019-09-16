//
//  AssetItemView.swift
//  MyAlbume
//
//  Created by 程晓龙 on 2019/8/15.
//  Copyright © 2019 程晓龙. All rights reserved.
//

import SwiftUI
import Photos

struct AssetItemView : View {
    var asset:PhotoAsset
    var imageFetcher:PhotoImage {
        PhotoImage(asset: asset.asset)
    }
    
    var body: some View {
        HStack {
            if (imageFetcher.image == nil) {
                Text("Fetching Image...")
            } else {
                Image(uiImage: imageFetcher.image!)
                Spacer()
                Text("\(asset.id)")
            }
        }
        .padding()
    }
}

#if DEBUG
struct AssetItemView_Previews : PreviewProvider {
    static var previews: some View {
        AssetItemView(asset: PhotoAsset(id: "", asset: PHAsset()))
    }
}
#endif
