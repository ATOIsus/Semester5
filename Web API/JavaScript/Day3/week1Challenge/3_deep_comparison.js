// 3.  Deep comparison

// The == operator compares objects by identity. 
// But sometimes you’d prefer to compare the values of their actual properties.

// Write a function deepEqual that takes two values and 
// returns true only if they are the same value or are objects with the same properties, 
// where the values of the properties are equal when compared with a recursive call to deepEqual.

// To find out whether values should be compared directly 
// (use the === operator for that) or have their properties compared, 
 // you can use the typeof operator. 
 
 // If it produces "object" for both values, you should do a deep comparison. 
 // But you have to take one silly exception into account: because of a historical accident, typeof null also produces "object".

// The Object.keys function will be useful when you need to go over the properties of objects to compare them.



const deepEqual = (var1, var2) => {

    let returnValue = false;

    //console.log(var1, " ", typeof(var1))
    //console.log(var2, " ", typeof(var2))

    
     if (typeof(var1) === 'object' && typeof(var2) === 'object') {

        if(!(var1 === null && var2 === null)){
            const lstKeys1 = Object.keys(var1);
            const lstKeys2 = Object.keys(var2);  

            const lstValues1 = Object.values(var1);
            const lstValues2 = Object.values(var2);

            for (let i = 0; i < lstKeys1.length-1; i++) {
                //console.log("Keys: " , lstKeys1[i], lstKeys2[i]);
                //console.log("Values" ,lstValues1[i], lstValues2[i]);               

                returnValue = deepEqual(lstKeys1[i], lstKeys2[i]);
                returnValue = deepEqual(lstValues1[i], lstValues2[i]);
            }       


        }else{
            console.log("Null is passed.")
            returnValue = false;
        }
    } 
    
    if(var1 === var2){
        returnValue =  true;
    }else{
        returnValue = false;
    }
    

    return returnValue;

}



let obj = {here: {is: "an"}, obb: 2};

console.log(deepEqual(obj, obj));

// true
console.log(deepEqual(obj, {here: 1, obb: 2}));

// false
console.log(deepEqual(obj, {here: {is: "an"}, obb: 2}));
