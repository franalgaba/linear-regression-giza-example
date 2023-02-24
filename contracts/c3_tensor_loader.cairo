%lang starknet

from starkware.cairo.common.alloc import alloc

from onnx_cairo.utils.math import vec_to_vec64x61
from onnx_cairo.operators.tensor import Tensor

func load_tensor_c3() -> (felt, felt, felt) {
    alloc_locals;
    
    let x = (1, 2, 3);
    let y = (1, 2, 3);
    let z = (1, 2, 3);

    let tensor = Tensor(x, y, z)
    return tensor;
}
