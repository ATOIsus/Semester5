const { avg } = require('../routes/for_test')

test('test of [1,2,3]', () => {
    const result = avg([1, 2, 3])
    expect(result).not.toBe(1)   //
})


describe('avg test', () => {

    test('test of [1,2,3]', () => {
        const result = avg([1, 2, 3])
        expect(result).toBe(2)
    })

    test('test of [1]', () => {
        const result = avg([1])
        expect(result).toBe(1)
    })

    test('test of []', () => {
        const result = avg([])
        expect(result).toBe(0)
    })


})







//first parameter: Test Description
//Second parameter: Callback function