describe 'About Higher Order Functions', ->
  it "should use 'for' for simple iteration", ->
    numbers = [3..0] # a reverse range
    msg = ''
    tell = (num) -> if num > 0 then "#{num}, " else "Blastoff!"
    msg += tell i for i in numbers # 'for' gives an array comprehension

    expect(msg).toEqual('3, 2, 1, Blastoff!')
    expect(numbers).toEqual([3, 2, 1, 0])


  it "should use 'in' to test inclusion", ->
    numbers = [1..3]

    expect(if 2 in numbers then true else false).toBe(true)


  it 'should use a Javascript-style filter to return array items that meet a criteria', ->
    numbers = [1..6]
    even = (a) -> if a % 2 == 0 then true else false # this can be shortened to 'even = (a) -> a % 2 == 0' when you are comfortable with it
    evens = numbers.filter even

    expect(evens).toEqual([2, 4, 6])
    expect(evens.length).toBe(3)
    expect(numbers.length).toBe(6)


  it 'should use a CoffeeScript-style filter', ->
    numbers = [1..6]
    even = (a) -> a % 2 == 0 
    odds = (x for x in numbers when not even x) # filter an array comprehension with 'when'

    expect(odds).toEqual([1, 3, 5])
    expect(odds.length).toBe(3)
    expect(numbers.length).toBe(6)


  it 'should use a Javascript-style map to transform each element', ->
    numbers = [1..3]
    plus1 = (a) -> a + 1
    numbersPlus1 = numbers.map plus1 # Javascript style map

    expect(numbers).toEqual([1, 2, 3])
    expect(numbersPlus1).toEqual([2, 3, 4])


  it 'should use a CoffeeScript style map to transform each element', ->
    numbers = [1..3]
    twice = (a) -> a * 2
    # simply place any function in front of 'for' for a map
    doubles = (twice x for x in numbers)

    expect(numbers).toEqual([1, 2, 3])
    expect(doubles).toEqual([2, 4, 6])


  it "should use Javascript-style 'reduce' to calculate a total over the array", ->
    numbers = [1..3]
    total = (i, a) -> i + a
    reduction = numbers.reduce total # Javascript style reduce

    expect(reduction).toBe(6)
    expect(numbers).toEqual([1, 2, 3])


  it 'should use a Coffeescript-style reduce to calculate a total', ->
    numbers = [1..3]
    total = 0
    # I'm a little unhappy with this as it uses a side-effect, but as comprehensions
    # compile down to a 'for' loop in Javascript I'm not sure there's a more elegant way
    sum = (a) -> total = total + a
    sum x for x in numbers

    expect(total).toBe(6)
    expect(numbers).toEqual([1, 2, 3])
