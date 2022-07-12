import UIKit
import Security

var cubeTop = [[String]]()
var cubeFront = [[String]]()
var cubeLeft = [[String]]()
var cubeBack = [[String]]()
var cubeRight = [[String]]()
var cubeBottom = [[String]]()

var tmpCubeTop = [[String]]()
var tmpCubeFront = [[String]]()
var tmpCubeLeft = [[String]]()
var tmpCubeBack = [[String]]()
var tmpCubeRight = [[String]]()
var tmpCubeBottom = [[String]]()


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
    
    cubeTop.append(topRow1)
    cubeTop.append(topRow2)
    cubeFront.append(frontRow1)
    cubeFront.append(frontRow2)
    cubeLeft.append(leftRow1)
    cubeLeft.append(leftRow2)
    cubeBack.append(backRow1)
    cubeBack.append(backRow2)
    cubeRight.append(rightRow1)
    cubeRight.append(rightRow2)
    cubeBottom.append(bottomRow1)
    cubeBottom.append(bottomRow2)

    print(cubeTop)
    print(cubeFront)
    print(cubeLeft)
    print(cubeBack)
    print(cubeRight)
    print(cubeBottom)

}

func createTmpCube() {
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

    tmpCubeTop.append(topRow1)
    tmpCubeTop.append(topRow2)
    tmpCubeFront.append(frontRow1)
    tmpCubeFront.append(frontRow2)
    tmpCubeLeft.append(leftRow1)
    tmpCubeLeft.append(leftRow2)
    tmpCubeBack.append(backRow1)
    tmpCubeBack.append(backRow2)
    tmpCubeRight.append(rightRow1)
    tmpCubeRight.append(rightRow2)
    tmpCubeBottom.append(bottomRow1)
    tmpCubeBottom.append(bottomRow2)
}

func checkCube() -> Bool {
    for row in Range(0...1) {
        for col in Range(0...1) {
            if cubeTop[row][col] != "w" {
                return false
            }
            if cubeFront[row][col] != "o" {
                return false
            }
            if cubeLeft[row][col] != "b" {
                return false
            }
            if cubeBack[row][col] != "r" {
                return false
            }
            if cubeRight[row][col] != "g" {
                return false
            }
            if cubeBottom[row][col] != "y" {
                return false
            }

        }
    }
    return true
}

func printCube() {
    print("         --- ---                 ")
    print("        | \(cubeTop[0][0]) | \(cubeTop[0][1]) | ")
    print("         --- ---                 ")
    print("        | \(cubeTop[1][0]) | \(cubeTop[1][1]) | ")
    print(" --- --- --- --- --- --- --- --- ")
    print("| \(cubeLeft[0][0]) | \(cubeLeft[0][1]) | \(cubeFront[0][0]) | \(cubeFront[0][1]) | \(cubeRight[0][0]) | \(cubeRight[0][1]) | \(cubeBack[0][0]) | \(cubeBack[0][1]) |")
    print(" --- --- --- --- --- --- --- --- ")
    print("| \(cubeLeft[1][0]) | \(cubeLeft[1][1]) | \(cubeFront[1][0]) | \(cubeFront[1][1]) | \(cubeRight[1][0]) | \(cubeRight[1][1]) | \(cubeBack[1][0]) | \(cubeBack[1][1]) |")
    print(" --- --- --- --- --- --- --- --- ")
    print("        | \(cubeBottom[0][0]) | \(cubeBottom[0][1]) | ")
    print("         --- ---                 ")
    print("        | \(cubeBottom[1][0]) | \(cubeBottom[1][1]) | ")
    print("         --- ---                 ")
}

func copyTmpCubeToCube() {
    cubeTop[0][0] = tmpCubeTop[0][0]
    cubeTop[0][1] = tmpCubeTop[0][1]
    cubeTop[1][0] = tmpCubeTop[1][0]
    cubeTop[1][1] = tmpCubeTop[1][1]
    cubeFront[0][0] = tmpCubeFront[0][0]
    cubeFront[0][1] = tmpCubeFront[0][1]
    cubeFront[1][0] = tmpCubeFront[1][0]
    cubeFront[1][1] = tmpCubeFront[1][1]
    cubeLeft[0][0] = tmpCubeLeft[0][0]
    cubeLeft[0][1] = tmpCubeLeft[0][1]
    cubeLeft[1][0] = tmpCubeLeft[1][0]
    cubeLeft[1][1] = tmpCubeLeft[1][1]
    cubeBack[0][0] = tmpCubeBack[0][0]
    cubeBack[0][1] = tmpCubeBack[0][1]
    cubeBack[1][0] = tmpCubeBack[1][0]
    cubeBack[1][1] = tmpCubeBack[1][1]
    cubeRight[0][0] = tmpCubeRight[0][0]
    cubeRight[0][1] = tmpCubeRight[0][1]
    cubeRight[1][0] = tmpCubeRight[1][0]
    cubeRight[1][1] = tmpCubeRight[1][1]
    cubeBottom[0][0] = tmpCubeBottom[0][0]
    cubeBottom[0][1] = tmpCubeBottom[0][1]
    cubeBottom[1][0] = tmpCubeBottom[1][0]
    cubeBottom[1][1] = tmpCubeBottom[1][1]
}

func rotateRightSideDown() {
    //top <- back <- botton <- face <-top
    tmpCubeTop[0][1] = cubeBack[0][0]
    tmpCubeTop[1][1] = cubeBack[1][0]
    tmpCubeBack[0][0] = cubeBottom[0][1]
    tmpCubeBack[1][0] = cubeBottom[1][1]
    tmpCubeBottom[0][1] = cubeFront[0][1]
    tmpCubeBottom[1][1] = cubeFront[1][1]
    tmpCubeFront[0][1] = cubeTop[0][1]
    tmpCubeFront[1][1] = cubeTop[1][1]
    // rotate rightside
    tmpCubeRight[0][0] = cubeRight[0][1]
    tmpCubeRight[0][1] = cubeRight[1][1]
    tmpCubeRight[1][0] = cubeRight[0][0]
    tmpCubeRight[1][1] = cubeRight[1][0]

    copyTmpCubeToCube()
}

func rotateFrontAntiClockwise() {
    //top <- right <- botton <- left <-top
    tmpCubeTop[1][0] = cubeRight[1][0]
    tmpCubeTop[1][1] = cubeRight[1][1]
    tmpCubeRight[1][0] = cubeBottom[0][0]
    tmpCubeRight[1][1] = cubeBottom[0][1]
    tmpCubeBottom[0][0] = cubeLeft[1][1]
    tmpCubeBottom[0][1] = cubeLeft[1][0]
    tmpCubeLeft[1][0] = cubeTop[1][0]
    tmpCubeLeft[1][1] = cubeTop[1][1]

    tmpCubeFront[0][0] = cubeFront[0][1]
    tmpCubeFront[0][1] = cubeFront[1][1]
    tmpCubeFront[1][0] = cubeFront[0][0]
    tmpCubeFront[1][1] = cubeFront[1][0]

    copyTmpCubeToCube()
}

func rotateLeftSideUp() {
    //top <- front <- botton <- back <-top
    tmpCubeTop[0][0] = cubeFront[0][0]
    tmpCubeTop[1][0] = cubeFront[1][0]
    tmpCubeFront[0][0] = cubeBottom[0][0]
    tmpCubeFront[1][0] = cubeBottom[1][0]
    tmpCubeBottom[0][0] = cubeBack[1][1]
    tmpCubeBottom[1][0] = cubeBack[0][1]
    tmpCubeBack[0][1] = cubeTop[1][0]
    tmpCubeBack[1][1] = cubeTop[0][0]
    // rotate rightside
    tmpCubeLeft[0][0] = cubeLeft[0][1]
    tmpCubeLeft[0][1] = cubeLeft[1][1]
    tmpCubeLeft[1][0] = cubeLeft[0][0]
    tmpCubeLeft[1][1] = cubeLeft[1][0]

    copyTmpCubeToCube()
}

func rotateBackClockwise() {
    //top <- left <- botton <- right <-top
    tmpCubeTop[0][0] = cubeLeft[0][0]
    tmpCubeTop[0][1] = cubeLeft[0][1]
    tmpCubeLeft[0][0] = cubeBottom[1][1]
    tmpCubeLeft[0][1] = cubeBottom[1][0]
    tmpCubeBottom[1][1] = cubeRight[0][0]
    tmpCubeBottom[1][0] = cubeRight[0][1]
    tmpCubeRight[0][0] = cubeTop[0][0]
    tmpCubeRight[0][1] = cubeTop[0][1]

    tmpCubeBack[0][0] = cubeBack[0][1]
    tmpCubeBack[0][1] = cubeBack[1][1]
    tmpCubeBack[1][0] = cubeBack[0][0]
    tmpCubeBack[1][1] = cubeBack[1][0]

    copyTmpCubeToCube()
}

createCube()
printCube()
checkCube()
createTmpCube()

//move
var count = 0
var cobeSolved = false
while !cobeSolved {
    rotateRightSideDown()
    rotateFrontAntiClockwise()
    rotateLeftSideUp()
    rotateBackClockwise()
    print(count)
    printCube()
    cobeSolved = checkCube()
    count += 1
}
print(count)


