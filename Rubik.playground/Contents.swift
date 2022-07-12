import UIKit
import Security

var front = [[String]]()
var left = [[String]]()
var top = [[String]]()
var right = [[String]]()
var bottom = [[String]]()
var back = [[String]]()

func createCube() {
    //    w, o, g, b, r y

    var topRow1 = ["w", "w"]
    var topRow2 = ["w", "w"]

    var frontRow1 = ["o", "o"]
    var frontRow2 = ["o", "o"]
    var leftRow1 = ["b", "b"]
    var leftRow2 = ["b", "b"]

    
    var backRow1 = ["r", "r"]
    var backRow2 = ["r", "r"]
    var rightRow1 = ["g", "g"]
    var rightRow2 = ["g", "g"]
    
    var bottomRow1 = ["y", "y"]
    var bottomRow2 = ["y", "y"]

    
    front.append(frontRow1)
    front.append(frontRow2)
    left.append(leftRow1)
    left.append(leftRow2)
    top.append(topRow1)
    top.append(topRow2)
    right.append(rightRow1)
    right.append(rightRow2)
    bottom.append(bottomRow1)
    bottom.append(bottomRow2)
    back.append(backRow1)
    back.append(backRow2)
    
    print(front)
    print(left)
    print(top)
    print(right)
    print(bottom)
    print(back)
}

func checkCube() -> Bool {
    for row in Range(0...1) {
        for col in Range(0...1) {
            if top[row][col] != "w" {
                return false
            }
            if front[row][col] != "o" {
                return false
            }
            if left[row][col] != "b" {
                return false
            }
            if back[row][col] != "r" {
                return false
            }
            if right[row][col] != "g" {
                return false
            }
            if bottom[row][col] != "y" {
                return false
            }

        }
    }
    return true
}

func rotateRightSideDown() {
    
}

func rotateFrontAntiClockwise() {
    
}

func rotateLeftSideUp() {
    
}

func rotateBackClockwise() {
    
}

createCube()
checkCube()
//move
//print(front[1][1])
//
//front[1][1] = "b"
//print(front[1][1])
