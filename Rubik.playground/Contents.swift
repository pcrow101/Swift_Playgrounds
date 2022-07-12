import UIKit
import Security

//            --- ---
//           | 0 | 1 |
//            -Back--
//           | 2 | 4 |
//    --- --- --- --- --- --- --- ---
//   | 0 | 1 | 0 | 1 | 0 | 1 | 0 | 1 |
//    -Left-- --Top-- -Right- --Bot--
//   | 2 | 3 | 2 | 3 | 2 | 3 | 2 | 3 |
//    --- --- --- --- --- --- --- ---
//           | 0 | 1 |
//            -Front-
//           | 2 | 3 |
//            --- ---


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
    cubeTop = ["w", "w", "w", "w"]
    cubeFront = ["o", "o", "o", "o"]
    cubeLeft = ["b", "b", "b", "b"]
    cubeBack = ["r", "r", "r", "r"]
    cubeRight = ["g", "g", "g", "g"]
    cubeBottom = ["y", "y", "y", "y"]
}

func createTmpCube() {
    tmpCubeTop = ["w", "w", "w", "w"]
    tmpCubeFront = ["o", "o", "o", "o"]
    tmpCubeLeft = ["b", "b", "b", "b"]
    tmpCubeBack = ["r", "r", "r", "r"]
    tmpCubeRight = ["g", "g", "g", "g"]
    tmpCubeBottom = ["y", "y", "y", "y"]
}

func checkCube() -> Bool {
    for square in Range(0...3) {
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
    print("         --- ---                 ")
    print("        | \(cubeBack[0]) | \(cubeBack[1]) | ")
    print("         --- ---                 ")
    print("        | \(cubeBack[2]) | \(cubeBack[3]) | ")
    print(" --- --- --- --- --- --- --- --- ")
    print("| \(cubeLeft[0]) | \(cubeLeft[1]) | \(cubeTop[0]) | \(cubeTop[1]) | \(cubeRight[0]) | \(cubeRight[1]) | \(cubeBottom[0]) | \(cubeBottom[1]) |")
    print(" --- --- --- --- --- --- --- --- ")
    print("| \(cubeLeft[2]) | \(cubeLeft[3]) | \(cubeTop[2]) | \(cubeTop[3]) | \(cubeRight[2]) | \(cubeRight[3]) | \(cubeBottom[2]) | \(cubeBottom[3]) |")
    print(" --- --- --- --- --- --- --- --- ")
    print("        | \(cubeFront[0]) | \(cubeFront[1]) | ")
    print("         --- ---                 ")
    print("        | \(cubeFront[2]) | \(cubeFront[3]) | ")
    print("         --- ---                 \n")
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
    //top <- back <- botton <- face <-top
    tmpCubeTop[1] = cubeBack[1]
    tmpCubeTop[3] = cubeBack[3]
    tmpCubeBack[1] = cubeBottom[2]
    tmpCubeBack[3] = cubeBottom[0]
    tmpCubeBottom[2] = cubeFront[1]
    tmpCubeBottom[0] = cubeFront[3]
    tmpCubeFront[1] = cubeTop[1]
    tmpCubeFront[3] = cubeTop[3]
    // rotate rightside
    tmpCubeRight[0] = cubeRight[1]
    tmpCubeRight[1] = cubeRight[3]
    tmpCubeRight[2] = cubeRight[0]
    tmpCubeRight[3] = cubeRight[2]

    copyTmpCubeToCube()
}

func rotateFrontAntiClockwise() {
    //top <- right <- botton <- left <-top
    tmpCubeTop[2] = cubeRight[2]
    tmpCubeTop[3] = cubeRight[3]
    tmpCubeRight[2] = cubeBottom[2]
    tmpCubeRight[3] = cubeBottom[3]
    tmpCubeBottom[2] = cubeLeft[2]
    tmpCubeBottom[3] = cubeLeft[3]
    tmpCubeLeft[2] = cubeTop[2]
    tmpCubeLeft[3] = cubeTop[3]

    tmpCubeFront[0] = cubeFront[1]
    tmpCubeFront[1] = cubeFront[3]
    tmpCubeFront[2] = cubeFront[0]
    tmpCubeFront[3] = cubeFront[2]

    copyTmpCubeToCube()
}

func rotateLeftSideUp() {
    //top <- front <- botton <- back <-top
    tmpCubeTop[0] = cubeFront[0]
    tmpCubeTop[2] = cubeFront[2]
    tmpCubeFront[0] = cubeBottom[3]
    tmpCubeFront[2] = cubeBottom[1]
    tmpCubeBottom[3] = cubeBack[0]
    tmpCubeBottom[1] = cubeBack[2]
    tmpCubeBack[0] = cubeTop[0]
    tmpCubeBack[2] = cubeTop[2]
    // rotate rightside
    tmpCubeLeft[0] = cubeLeft[1]
    tmpCubeLeft[1] = cubeLeft[3]
    tmpCubeLeft[2] = cubeLeft[0]
    tmpCubeLeft[3] = cubeLeft[2]

    copyTmpCubeToCube()
}

func rotateBackClockwise() {
    //top <- left <- botton <- right <-top
    tmpCubeTop[0] = cubeLeft[0]
    tmpCubeTop[1] = cubeLeft[1]
    tmpCubeLeft[0] = cubeBottom[0]
    tmpCubeLeft[1] = cubeBottom[1]
    tmpCubeBottom[0] = cubeRight[0]
    tmpCubeBottom[1] = cubeRight[1]
    tmpCubeRight[0] = cubeTop[0]
    tmpCubeRight[1] = cubeTop[1]

    tmpCubeBack[0] = cubeBack[1]
    tmpCubeBack[1] = cubeBack[3]
    tmpCubeBack[2] = cubeBack[0]
    tmpCubeBack[3] = cubeBack[2]

    copyTmpCubeToCube()
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
    rotateLeftSideUp()
    rotateBackClockwise()
//    rotateRightSideDown()
//    rotateFrontAntiClockwise()
    print(count)
    count += 4
    cubeSolved = checkCube()
}
print(count)

