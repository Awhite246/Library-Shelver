//
//  ShelfView.swift
//  Library Shelver
//
//  Created by Alistair White on 2/6/23.
//

import SwiftUI

//displays books and allows dragging around for reordering
struct ShelfView: View {
    var body: some View {
        /* Sudo Code:
         * Display a bunch of books (ZStack?)
         * Simulate HStack through .offset
         * Book spillage (off screen) moves next book to next shelf
         * Have drag gesture change offset of book
         * Use .onChange to dynamicly update other book positions
         * Use .onEnded to finalize book positions
         * Update book positions (array?) that checker will use
         */
        Text("Shelf View")
    }
}

struct ShelfView_Previews: PreviewProvider {
    static var previews: some View {
        ShelfView()
    }
}
