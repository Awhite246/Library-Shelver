//
//  PlayScreen.swift
//  Library Shelver
//
//  Created by Victor Gunderson on 3/8/23.
//

import SwiftUI

struct PlayScreen: View {
    var body: some View {
        VStack {
            
        } .background(
            ZStack {
                Color.mint
                    .scaledToFill()
                    .frame(width: 1000, height: 300)
            }
        )
    }
}

struct PlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayScreen()
    }
}
