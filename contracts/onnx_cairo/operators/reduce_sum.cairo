from starkware.cairo.common.alloc import alloc
from cairo_math_64x61.vec64x61 import Vec64x61


// func reduce_sum{range_check_ptr}(a: (felt, felt, felt), axis: felt) -> (felt, felt, felt) {

    // if axis == 0
    // usage of recursion is needed: https://www.cairo-lang.org/docs/hello_cairo/intro.html?highlight=loop
    // if axis == 1
// }