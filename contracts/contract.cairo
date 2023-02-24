%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.alloc import alloc

from onnx_cairo.operators.add import add
from onnx_cairo.operators.mul import mul
// from onnx_cairo.operators.reduce_sum import reduce_sum

from contracts.c5_tensor_loader import load_tensor_c5
from contracts.c4_tensor_loader import load_tensor_c4
from contracts.c3_tensor_loader import load_tensor_c3


// Starts the inference computation.
@external
func predict{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr} ()  -> (res: (felt, felt, felt)){

    alloc_locals;

    // Read Tensors
    let c3_node = load_tensor_c3();
    let c4_node = load_tensor_c4();

    // Read inputs
    let zx = load_tensor_c5();

    // let permutation_1 : felt* = alloc();
    // assert  [permutation_1] = 1;
    // assert  [permutation_1 + 1] = 2;

    // Build graph
    let mulx = add(zx, c3_node);

    // TODO: Solve axis_sum memory issue;
    // let (sumx) = axis_sum(mulx, permutation_1);
    // let (yhatlog) = elem_x_elem_mul(sumx, c4_node);

    let yhatlog = mul(mulx, c4_node);

    return (res=(yhatlog[0], yhatlog[1], yhatlog[2]));
}