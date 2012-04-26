describe 'About Arrays', ->
  it 'should create arrays', ->
  # We shall contemplate truth by testing reality, via spec expectations.
    emptyArray = []

    expect(typeof emptyArray).toBe('object') # A mistake? - http://j.mp/oRuo6R
    expect(emptyArray.length).toBe(0)


  it 'should understand array literals', ->
    array = []
    expect(array).toEqual([])

    array[0] = 1
    expect(array).toEqual([1])

    array[1] = 2
    expect(array).toEqual([1, 2])

    array.push(3)
    expect(array).toEqual([1, 2, 3])


  it 'should understand array length', ->
    fourNumberArray = [1, 2, 3, 4]

    expect(fourNumberArray.length).toBe(4)
    fourNumberArray.push(5, 6)
    expect(fourNumberArray.length).toBe(6)

    tenEmptyElementArray = new Array(10)
    expect(tenEmptyElementArray.length).toBe(10)

    tenEmptyElementArray.length = 5
    expect(tenEmptyElementArray.length).toBe(5)


  it 'should understand multitype arrays', ->
    multiTypeArray = [0 # newlines substitute for commas in CoffeeScript
                      1
                      'two'
                      -> 3 # anonymous functions can be array elements
                      value1: 4 # is this one object?
                      value2: 5 # or two objects?
                      [6
                      7]]

    expect(multiTypeArray[0]).toBe(0)
    expect(multiTypeArray[2]).toBe('two')
    expect(multiTypeArray[3]()).toBe(3) # Note the parens!
    expect(multiTypeArray[4].value1).toBe(4)
    expect(multiTypeArray[5][0]).toBe(6)


  it 'should understand array ranges', ->
    range = [1..5]
    expect(range).toEqual([1, 2, 3, 4, 5])

    sdrawkcab = [3..1]
    expect(sdrawkcab).toEqual([3, 2, 1])

  it 'should understand array comprehension', ->
    array = [1, 2, 3]
    accumulator = 0
    for element in array
      accumulator += element

    expect(accumulator).toEqual(6)


  it 'should understand a more compact array comprehension', ->
    array = [1, 2, 3]
    accumulator = 1
    accumulator += element for element in array

    expect(accumulator).toEqual(7)


  it 'should slice arrays', ->
    array = ["peanut", "butter", "and", "jelly"]

    expect(array.slice(0, 1)).toEqual(["peanut"])
    expect(array.slice(0, 2)).toEqual(["peanut", "butter"])
    expect(array.slice(2, 2)).toEqual([])
    expect(array.slice(2, 20)).toEqual(["and", "jelly"])
    expect(array.slice(3, 0)).toEqual([])
    expect(array.slice(3, 100)).toEqual(["jelly"])
    expect(array.slice(5, 1)).toEqual([])


  it 'should understand range slicing', ->
    oneToTen = [1..10]
    expect(oneToTen[3..5]).toEqual([4, 5, 6])

    myString = "my string"[0..2]
    expect(myString).toEqual('my ')

    firstTwo = ['one', 'two', 'three']
    expect(firstTwo[0..1]).toEqual(['one', 'two'])


  it 'should know array references', ->
    array = [ 'zero', 'one', 'two'
              'three', 'four', 'five' ]

    passedByReference = (refArray) -> refArray[1] = 'changed in function'

    passedByReference array
    expect(array[1]).toBe('changed in function')

    assignedArray = array
    assignedArray[5] = 'changed in assignedArray'
    expect(array[5]).toBe('changed in assignedArray')

    copyOfArray = array.slice()
    copyOfArray[3] = 'changed in copyOfArray'
    expect(array[3]).toBe('three')


  it 'should push and pop', ->
    array = [1, 2]

    array.push 3
    expect(array).toEqual([1, 2, 3])

    poppedValue = array.pop()
    expect(poppedValue).toBe(3)
    expect(array).toEqual([1, 2])


  it 'should shift arrays', ->
    array = [1, 2]

    array.unshift 3
    expect(array).toEqual([3, 1, 2])

    shiftedValue = array.shift()
    expect(shiftedValue).toEqual(3)
    expect(array).toEqual([1, 2])
