%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin, BitwiseBuiltin

from cairo_math_64x61.math64x61 import Math64x61

func vec_to_vec64x61{range_check_ptr}(vec : (felt, felt, felt)) -> (res: (felt, felt, felt)){
    let x_64x61 = Math64x61.fromFelt(vec[0]);
    let y_64x61 = Math64x61.fromFelt(vec[1]);
    let z_64x61 = Math64x61.fromFelt(vec[2]);
    return (res=(x_64x61, y_64x61, z_64x61));
}