from starkware.cairo.common.alloc import alloc
from cairo_math_64x61.vec64x61 import Vec64x61


func mul{range_check_ptr}(a: (felt, felt, felt), b: felt) -> (felt, felt, felt) {
    let res = Vec64x61.mul(a, b);
    return res;
}