//
//  TeaManager.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 26.12.2025.
//

import UIKit

class TeaManager {
    static func getTeas() -> [TeaModel] {
        return [
            TeaModel(nameTea: NameTea.tea_1.rawValue,
                     description: DescriptionTeas.tea_1.rawValue),
            TeaModel(nameTea: NameTea.tea_2.rawValue,
                     description: DescriptionTeas.tea_2.rawValue),
            TeaModel(nameTea: NameTea.tea_3.rawValue,
                     description: DescriptionTeas.tea_3.rawValue),
            TeaModel(nameTea: NameTea.tea_4.rawValue,
                     description: DescriptionTeas.tea_4.rawValue),
            TeaModel(nameTea: NameTea.tea_5.rawValue,
                     description: DescriptionTeas.tea_5.rawValue),
            TeaModel(nameTea: NameTea.tea_6.rawValue,
                     description: DescriptionTeas.tea_6.rawValue),
            TeaModel(nameTea: NameTea.tea_7.rawValue,
                     description: DescriptionTeas.tea_7.rawValue)
        ]
    }
}


