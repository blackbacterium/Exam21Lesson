//
//  TeaDataManager.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 27.12.2025.
//

import UIKit

class TeaDataManager {
    private var teas: [TeaModel] = []
    private var currentIndex = 0
    
    init(teas: [TeaModel]) {
        self.teas = teas
    }
    
    func getCurrentTea() -> TeaModel {
        teas[currentIndex]
    }
    
    func getNextTea() -> TeaModel {
        if currentIndex < teas.count - 1 {
            currentIndex += 1
        }
        return getCurrentTea()
    }
    
    func getLastTea() -> TeaModel {
        if currentIndex > 0 {
            currentIndex -= 1
        }
        return getCurrentTea()
    }
    
    func getFirstTea() -> TeaModel {
        currentIndex = 0
        return getCurrentTea()
    }
}

