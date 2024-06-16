//
//  String + ext.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 30.05.2024.
//

import UIKit

extension String {
    
    
    //chunks in word
    func chunked(size: Int) -> [String] {
        
        var chunks: [String] = []
        var startIndex = self.startIndex
        
        while startIndex < self.endIndex {
            
            let endIndex = self.index(startIndex,
                                      offsetBy: size,
                                      limitedBy: self.endIndex) ?? self.endIndex
            chunks.append(String(self[startIndex..<endIndex]))
            startIndex = endIndex
        }
        
        return chunks
    }
    
}
