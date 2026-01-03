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
            TeaModel(nameTea: NameTea.tea_1,
                     description: DescriptionTeas.tea_1),
            TeaModel(nameTea: NameTea.tea_2,
                     description: DescriptionTeas.tea_2),
            TeaModel(nameTea: NameTea.tea_3,
                     description: DescriptionTeas.tea_3),
            TeaModel(nameTea: NameTea.tea_4,
                     description: DescriptionTeas.tea_4),
            TeaModel(nameTea: NameTea.tea_5,
                     description: DescriptionTeas.tea_5),
            TeaModel(nameTea: NameTea.tea_6,
                     description: DescriptionTeas.tea_6),
            TeaModel(nameTea: NameTea.tea_7,
                     description: DescriptionTeas.tea_7)
        ]
    }
}


