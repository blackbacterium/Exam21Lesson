//
//  TeaDataManager.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 27.12.2025.
//

import UIKit

protocol ITeaDataManager {
    func getIsMarkTeas() -> [TeaModel]
    func toggleMark(index: Int)
    func removeTea(index: Int)
    func getAllTeas() -> [TeaModel]
    func getCurrentTea() -> TeaModel
    func getNextTea() -> TeaModel
    func getLastTea() -> TeaModel
    func getFirstTea() -> TeaModel
    func getModelByImageName(_ imageName: String) -> TeaModel?
}

class TeaDataManager: ITeaDataManager {
    private var teas: [TeaModel] = []
    private var currentIndex = 0
    
    init(teas: [TeaModel]) {
        self.teas = teas
    }
    
    func getIsMarkTeas() -> [TeaModel] {
        var isMarkTeas = [TeaModel]()
        for tea in teas {
            if tea.isMark {
                isMarkTeas.append(tea)
            }
        }
        return isMarkTeas
    }
    
    func toggleMark(index: Int) {
        teas[index].isMark.toggle()
    }
    
    func removeTea(index: Int) {
        teas.remove(at: index)
    }
    
    func getAllTeas() -> [TeaModel] {
        teas
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
    
    func getModelByImageName(_ imageName: String) -> TeaModel? {
        for currentModel in teas {
            if currentModel.nameTea == imageName {
                return currentModel
            }
        }
        return nil
    }
}

