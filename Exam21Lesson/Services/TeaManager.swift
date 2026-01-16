//
//  TeaManager.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 26.12.2025.
//

import UIKit

protocol ITeaManager {
    func getTeas() -> [TeaModel]
}

class TeaManager: ITeaManager {
    func getTeas() -> [TeaModel] {
        [
            TeaModel(nameTea: NameTea.tea_1,
                     teaDescription: DescriptionTeas.tea_1),
            TeaModel(nameTea: NameTea.tea_2,
                     teaDescription: DescriptionTeas.tea_2),
            TeaModel(nameTea: NameTea.tea_3,
                     teaDescription: DescriptionTeas.tea_3),
            TeaModel(nameTea: NameTea.tea_4,
                     teaDescription: DescriptionTeas.tea_4),
            TeaModel(nameTea: NameTea.tea_5,
                     teaDescription: DescriptionTeas.tea_5),
            TeaModel(nameTea: NameTea.tea_6,
                     teaDescription: DescriptionTeas.tea_6),
            TeaModel(nameTea: NameTea.tea_7,
                     teaDescription: DescriptionTeas.tea_7)
        ]
    }
}


