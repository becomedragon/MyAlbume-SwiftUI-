//
//  CollectionItemView.swift
//  MyAlbume
//
//  Created by 程晓龙 on 2019/8/13.
//  Copyright © 2019 程晓龙. All rights reserved.
//

import SwiftUI
import Photos

struct CollectionItemView : View {
    var collection:CollectionModel
    
    var body: some View {
        HStack(alignment: .center) {
            Text(collection.name).font(.subheadline)
            Spacer()
        }
        .padding()
    }
}

#if DEBUG
struct CollectionItemView_Previews : PreviewProvider {
    static var previews: some View {
        CollectionItemView(collection: CollectionModel(id:0,name: "相册", identifier: "123", collection: PHAssetCollection()))
    }
}
#endif
