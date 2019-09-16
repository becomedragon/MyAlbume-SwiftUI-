//
//  AlbumHome.swift
//  MyAlbume
//
//  Created by 程晓龙 on 2019/8/13.
//  Copyright © 2019 程晓龙. All rights reserved.
//

import SwiftUI
import Combine

struct AlbumHome : View {
    @ObjectBinding var collectionList = PhotoCollectionModel()
    var body: some View {
        Group {
            if (collectionList.photoCollections == nil) {
                Text("Loading...")
            } else {
                NavigationView {
                    List(collectionList.photoCollections!) { item in
        NavigationButton(destination:AssetListView(collection: item)) {
                            CollectionItemView(collection: item)
                        }
                    }
                }
                .navigationBarTitle(Text("All Albums"))
            }
        }
        
    }
}

#if DEBUG
struct AlbumHome_Previews : PreviewProvider {
    static var previews: some View {
        AlbumHome()
    }
}
#endif
