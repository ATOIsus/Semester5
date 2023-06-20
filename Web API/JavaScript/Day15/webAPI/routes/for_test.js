const avg = (numbers) => {
    // const reducer = (acc, n) => acc + n
    // const total = numbers.reduce(reducer(acc,n), 0)

    const total = numbers.reduce((acc, n) => acc + n, 0)
    return numbers.length == 0 
            ?0 
            :total / numbers.length
}


module.exports = { avg }