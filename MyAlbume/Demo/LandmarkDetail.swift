//
//  ContentView.swift
//  MyAlbume
//
//  Created by 程晓龙 on 2019/8/13.
//  Copyright © 2019 程晓龙. All rights reserved.
//

import SwiftUI

struct LandmarkDetail : View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height:300)
            CircleImage().offset(y:-50).padding(.bottom,-30)
            VStack(alignment:.leading) {
                Text("Name")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("desc").font(.subheadline)
                    Spacer().font(.subheadline)
                    Text("Type")
                   }
                }
                .padding()
                Spacer()
        }
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail()
    }
}
#endif
