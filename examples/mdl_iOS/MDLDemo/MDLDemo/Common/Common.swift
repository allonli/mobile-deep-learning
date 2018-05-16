//
/* Copyright (c) 2017 Baidu, Inc. All Rights Reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 ==============================================================================*/

import Foundation


// 自定义 ?!  如果 ?! 前的返回值为一个可选值, 则进行隐式解包, 如果有值则返回这个值, 如果为nil 则fatalError 传入的信息
precedencegroup ExecutedOrFatalError{
    associativity: left
    higherThan: AssignmentPrecedence
}
infix operator ?!: ExecutedOrFatalError
func ?!<T>(option: T?, excuteOrError: @autoclosure () -> String) -> T{
    if let inOpt = option {
        return inOpt
    }else{
        fatalError(excuteOrError())
    }
}

extension Array where Element: Comparable{
    func top(r: Int) -> [(Int, Element)] {
        precondition(r <= self.count)
        return Array<(Int, Element)>(zip(0..<self.count, self).sorted{ $0.1 > $1.1 }.prefix(through: r - 1))
    }
}

