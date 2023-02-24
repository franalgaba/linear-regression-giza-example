from starkware.cairo.common.alloc import alloc

from cairo_math_64x61.vec64x61 import Vec64x61
from onnx_cairo.operators.tensor import Tensor


func add{range_check_ptr}(a: Tensor, b: Tensor) -> Tensor {
    let res = Vec64x61.add(a, b);
    return res;
}
