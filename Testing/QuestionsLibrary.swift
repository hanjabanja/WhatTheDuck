//
//  QuestionsLibrary.swift
//  Testing
//
//  Created by Hannah Werdmuller on 5/27/15.
//  Copyright (c) 2015 pathdigger. All rights reserved.
//

import Foundation
import UIKit

struct Questions {
    var library =
    [
        [
            "questiontype": "draganddrop",
            "text": "Pictured below is a labelled diagram of the anatomical areas of a duck's head.",
            "beforeSelectText": "Drag and drop the labels to their correct positions, and press Submit when done.",
            "image": "DuckHeadWithArrows_rgb",
// note: image file is 258 x 232
            "labelheight": 30,
            "labelwidth": 100,
            "label1title": "Neck", "label1x": 159, "label1y": 370,
            "label2title": "Face", "label2x": 52, "label2y": 309,
            "label3title": "Bill", "label3x": 52, "label3y": 159,
            "label4title": "Crown", "label4x": 137, "label4y": 119
        ],
        [
            "questiontype": "twoimagesselect",
// note: image files are 220 x 140
            "level": 1,
            "text": "Pictured below are a Cinnamon Teal (top) and a Long-Tailed Duck (bottom). The Cinnamon Teal is a dabbling duck, and the Long-Tailed Duck is a diving duck. Select the duck that spends more time in deeper water.",
            "image": "CinnamonTeal4",
            "image2": "Long-TailedDuck1",
            "correct": "Long-TailedDuck1",
            "textAfterSelect": "The Long-Tailed Duck is one of the deepest diving ducks in the world - it will dive up to 60m deep to find food, and spends up to 80% of its feeding time submerged! The Cinnamon Teal is a dabbling duck that usually feeds in shallow water, very rarely diving for food."
        ],
        [
            "questiontype": "threeimagesselect",
// note: image files are 130 x 130
            "level": 2,
            "text": "Ducks (like swans, geese, and loons) have webbed feet, with all toes joined. Coots and grebes have lobed feet, where the toes are separate but flattened. Pictured below are the feet of a Mallard, an American Coot, and a Horned Grebe. Select the Mallard!",
            "image": "AmericanCoot2",
            "image2": "HornedGrebe1",
            "image3": "Mallard13",
            "correct": "Mallard13",
            "textAfterSelect": "The Mallard, like all ducks, has webbed feet. The American Coot and Horned Grebe, like all Coots and Grebes, have lobed feet. The high surface area of webbed and lobed feet makes them excellent for swimming."
        ],
        [
            "questiontype": "fourtextbuttonsselect",
// note: no images!
            "level": 3,
            "text": "What color is the bill of a male Mallard?",
            "label1title": "Red with a pink nail",
            "label2title": "Blue with a black nail",
            "label3title": "Yellow with a black nail",
            "label4title": "Black with a black nail",
            "correct": "Yellow with a black nail",
            "textAfterSelect": "The male Mallard has a bright yellow bill with a black nail."
        ]
    ]
}

