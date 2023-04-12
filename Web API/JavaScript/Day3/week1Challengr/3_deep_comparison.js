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
    
     if (typeof(var1) === 'object' && typeof(var2) === 'object') {

        if(var1 !== null && var2 !== null){
            let lstElements1 = Object.keys(var1);
            let lstElements2 = Object.keys(var2);  

            for (let i = 0; i < lstElements1.length-1; i++) {
                if (lstElements1[i] === lstElements2[i]) {
                    console.log(lstElements1[i] , lstElements2[i])
                    
                }else{
                    return false;
                }     
            }
        }else{
            console.log("Null is passed.")
            return false;
        }
    }  else if(var1 !== var2){
        return false;
    }

    return true;
}



let obj = {here: {is: "an"}, object: 2};

console.log(deepEqual(obj, obj));

// true
console.log(deepEqual(obj, {here: 1, object: 2}));

// false
console.log(deepEqual(obj, {here: {is: "an"}, object: 2}));
