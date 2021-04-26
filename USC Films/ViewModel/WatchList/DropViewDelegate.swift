//
//  DropViewDelegate.swift
//  USC Films
//
//  Created by Sourabh Gapate on 26/04/21.
//

import SwiftUI

struct DropViewDelegate: DropDelegate {
    
    var item: WatchListItem
    var watchListVM: WatchListViewModel
    
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    
    func dropEntered(info: DropInfo) {
        
        // Get From and To index
        
        // From index
        let fromIndex = watchListVM.list.firstIndex { (item) -> Bool in
            return item.id == watchListVM.currentItem?.id
        } ?? 0
        
        // To index
        let toIndex = watchListVM.list.firstIndex { (item) -> Bool in
            return item.id == self.item.id
        } ?? 0
        
        // Check if both are not safe
        if fromIndex != toIndex {
            // Animation
            withAnimation {
                // Swapping items
                let fromItem = watchListVM.list[fromIndex]
                watchListVM.list[fromIndex] = watchListVM.list[toIndex]
                watchListVM.list[toIndex] = fromItem
            }
        }
        
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
}
