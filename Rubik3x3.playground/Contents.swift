import UIKit
import Security
// 3x3 Cube
//                   Back
//                --- --- ---
//               | 0 | 1 | 2 |
//                --- --- ---
//               | 3 | 4 | 5 |
//                --- --- ---
//    Left       | 6 | 7 | 8 |   Right      Bottom
//    --- --- --- --- --- --- --- --- --- --- --- ---
//   | 0 | 1 | 2 | 0 | 1 | 2 | 0 | 1 | 2 | 0 | 1 | 2 |
//    --- --- --- --- --- --- --- --- --- --- --- ---
//   | 3 | 4 | 5 | 3 | 4 | 5 | 3 | 4 | 5 | 3 | 4 | 5 |
//    --- --- --- --- --- --- --- --- --- --- --- ---
//   | 6 | 7 | 8 | 6 | 7 | 8 | 6 | 7 | 8 | 6 | 7 | 8 |
//    --- --- --- --- --- --- --- --- --- --- --- ---
//               | 0 | 1 | 2 |
//                --- --- ---
//               | 3 | 4 | 5 |
//                --- --- ---
//               | 6 | 7 | 8 |
//                --- --- ---
//                   Front


var cubeTop = [String]()
var cubeFront = [String]()
var cubeLeft = [String]()
var cubeBack = [String]()
var cubeRight = [String]()
var cubeBottom = [String]()

var tmpCubeTop = [String]()
var tmpCubeFront = [String]()
var tmpCubeLeft = [String]()
var tmpCubeBack = [String]()
var tmpCubeRight = [String]()
var tmpCubeBottom = [String]()


func createCube() {
    cubeTop = ["w", "w", "w", "w", "w", "w", "w", "w", "w"]
    cubeFront = ["o", "o", "o", "o", "o", "o", "o", "o", "o"]
    cubeLeft = ["b", "b", "b", "b", "b", "b", "b", "b", "b"]
    cubeBack = ["r", "r", "r", "r", "r", "r", "r", "r", "r"]
    cubeRight = ["g", "g", "g", "g", "g", "g", "g", "g", "g"]
    cubeBottom = ["y", "y", "y", "y", "y", "y", "y", "y", "y"]
}

func createTmpCube() {
    tmpCubeTop = ["w", "w", "w", "w", "w", "w", "w", "w", "w"]
    tmpCubeFront = ["o", "o", "o", "o", "o", "o", "o", "o", "o"]
    tmpCubeLeft = ["b", "b", "b", "b", "b", "b", "b", "b", "b"]
    tmpCubeBack = ["r", "r", "r", "r", "r", "r", "r", "r", "r"]
    tmpCubeRight = ["g", "g", "g", "g", "g", "g", "g", "g", "g"]
    tmpCubeBottom = ["y", "y", "y", "y", "y", "y", "y", "y", "y"]
}

func checkCube() -> Bool {
    for square in Range(0...8) {
        if cubeTop[square] != "w" {
            return false
        }
        if cubeFront[square] != "o" {
            return false
        }
        if cubeLeft[square] != "b" {
            return false
        }
        if cubeBack[square] != "r" {
            return false
        }
        if cubeRight[square] != "g" {
            return false
        }
        if cubeBottom[square] != "y" {
            return false
        }
    }
    return true
}

func printCube() {
    print("                --- --- --- ")
    print("               | \(cubeBack[0]) | \(cubeBack[1]) | \(cubeBack[2]) |")
    print("                --- --- --- ")
    print("               | \(cubeBack[3]) | \(cubeBack[4]) | \(cubeBack[5]) |")
    print("                --- --- --- ")
    print("               | \(cubeBack[6]) | \(cubeBack[7]) | \(cubeBack[8]) |")
    print("    --- --- --- --- --- --- --- --- --- --- --- --- ")
    print("   | \(cubeLeft[0]) | \(cubeLeft[1]) | \(cubeLeft[2]) | \(cubeTop[0]) | \(cubeTop[1]) | \(cubeTop[2]) | \(cubeRight[0]) | \(cubeRight[1]) | \(cubeRight[2]) | \(cubeBottom[0]) | \(cubeBottom[1]) | \(cubeBottom[2]) |")
    print("    --- --- --- --- --- --- --- --- --- --- --- --- ")
    print("   | \(cubeLeft[3]) | \(cubeLeft[4]) | \(cubeLeft[5]) | \(cubeTop[3]) | \(cubeTop[4]) | \(cubeTop[5]) | \(cubeRight[3]) | \(cubeRight[4]) | \(cubeRight[5]) | \(cubeBottom[3]) | \(cubeBottom[4]) | \(cubeBottom[5]) |")
    print("    --- --- --- --- --- --- --- --- --- --- --- --- ")
    print("   | \(cubeLeft[6]) | \(cubeLeft[7]) | \(cubeLeft[8]) | \(cubeTop[6]) | \(cubeTop[7]) | \(cubeTop[8]) | \(cubeRight[6]) | \(cubeRight[7]) | \(cubeRight[8]) | \(cubeBottom[6]) | \(cubeBottom[7]) | \(cubeBottom[8]) |")
    print("    --- --- --- --- --- --- --- --- --- --- --- --- ")
    print("               | \(cubeFront[0]) | \(cubeFront[1]) | \(cubeFront[2]) |")
    print("                --- --- --- ")
    print("               | \(cubeFront[3]) | \(cubeFront[4]) | \(cubeFront[5]) |")
    print("                --- --- --- ")
    print("               | \(cubeFront[6]) | \(cubeFront[7]) | \(cubeFront[8]) |")
    print("                --- --- --- \n")
}

func copyTmpCubeToCube() {
    cubeTop = tmpCubeTop
    cubeFront = tmpCubeFront
    cubeLeft = tmpCubeLeft
    cubeBack = tmpCubeBack
    cubeRight = tmpCubeRight
    cubeBottom = tmpCubeBottom
}

func rotateRightSideDown() {
    // top <- back <- botton <- face <-top
    tmpCubeTop[2] = cubeBack[2]
    tmpCubeTop[5] = cubeBack[5]
    tmpCubeTop[8] = cubeBack[8]
    
    tmpCubeBack[2] = cubeBottom[6]
    tmpCubeBack[5] = cubeBottom[3]
    tmpCubeBack[8] = cubeBottom[0]
    
    tmpCubeBottom[6] = cubeFront[2]
    tmpCubeBottom[3] = cubeFront[5]
    tmpCubeBottom[0] = cubeFront[8]
    
    tmpCubeFront[2] = cubeTop[2]
    tmpCubeFront[5] = cubeTop[5]
    tmpCubeFront[8] = cubeTop[8]
    
    // rotate rightside
    tmpCubeRight[0] = cubeRight[2]
    tmpCubeRight[1] = cubeRight[5]
    tmpCubeRight[2] = cubeRight[8]
    
    tmpCubeRight[3] = cubeRight[1]
    tmpCubeRight[4] = cubeRight[4]
    tmpCubeRight[5] = cubeRight[7]
    
    tmpCubeRight[6] = cubeRight[0]
    tmpCubeRight[7] = cubeRight[3]
    tmpCubeRight[8] = cubeRight[6]

    copyTmpCubeToCube()
}

func rotateFrontAntiClockwise() {
    //top <- right <- botton <- left <-top
    tmpCubeTop[6] = cubeRight[6]
    tmpCubeTop[7] = cubeRight[7]
    tmpCubeTop[8] = cubeRight[8]

    tmpCubeRight[6] = cubeBottom[6]
    tmpCubeRight[7] = cubeBottom[7]
    tmpCubeRight[8] = cubeBottom[8]

    tmpCubeBottom[6] = cubeLeft[6]
    tmpCubeBottom[7] = cubeLeft[7]
    tmpCubeBottom[8] = cubeLeft[8]

    tmpCubeLeft[6] = cubeTop[6]
    tmpCubeLeft[7] = cubeTop[7]
    tmpCubeLeft[8] = cubeTop[8]

    tmpCubeFront[0] = cubeFront[2]
    tmpCubeFront[1] = cubeFront[5]
    tmpCubeFront[2] = cubeFront[8]
    
    tmpCubeFront[3] = cubeFront[1]
    tmpCubeFront[4] = cubeFront[4]
    tmpCubeFront[5] = cubeFront[7]

    tmpCubeFront[6] = cubeFront[0]
    tmpCubeFront[7] = cubeFront[3]
    tmpCubeFront[8] = cubeFront[6]

    copyTmpCubeToCube()
}

func rotateLeftSideUp() {
    //top <- front <- botton <- back <-top
//    tmpCubeTop[0] = cubeFront[0]
//    tmpCubeTop[2] = cubeFront[2]
//    tmpCubeFront[0] = cubeBottom[3]
//    tmpCubeFront[2] = cubeBottom[1]
//    tmpCubeBottom[3] = cubeBack[0]
//    tmpCubeBottom[1] = cubeBack[2]
//    tmpCubeBack[0] = cubeTop[0]
//    tmpCubeBack[2] = cubeTop[2]
    // rotate rightside
//    tmpCubeLeft[0] = cubeLeft[1]
//    tmpCubeLeft[1] = cubeLeft[3]
//    tmpCubeLeft[2] = cubeLeft[0]
//    tmpCubeLeft[3] = cubeLeft[2]

//    copyTmpCubeToCube()
}

func rotateBackClockwise() {
    //top <- left <- botton <- right <-top
//    tmpCubeTop[0] = cubeLeft[0]
//    tmpCubeTop[1] = cubeLeft[1]
//    tmpCubeLeft[0] = cubeBottom[0]
//    tmpCubeLeft[1] = cubeBottom[1]
//    tmpCubeBottom[0] = cubeRight[0]
//    tmpCubeBottom[1] = cubeRight[1]
//    tmpCubeRight[0] = cubeTop[0]
//    tmpCubeRight[1] = cubeTop[1]

//    tmpCubeBack[0] = cubeBack[1]
//    tmpCubeBack[1] = cubeBack[3]
//    tmpCubeBack[2] = cubeBack[0]
//    tmpCubeBack[3] = cubeBack[2]

//    copyTmpCubeToCube()
}

createCube()
printCube()
checkCube()
createTmpCube()

//move
var count = 0
var cubeSolved = false
while !cubeSolved {
    rotateRightSideDown()
    rotateFrontAntiClockwise()
//    rotateLeftSideUp()
//    rotateBackClockwise()

    print(count)
    count += 1
    cubeSolved = checkCube()
}
print(count)
printCube()
checkCube()
