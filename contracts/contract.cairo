# Declare this file as a StarkNet contract.
%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.alloc import alloc

from contracts.onnx_cairo.tensor_utils import elem_x_elem_add, axis_sum, elem_x_elem_mul
from contracts.onnx_cairo.tensor_data_types import Tensor
from contracts.c5_tensor_loader import load_tensor_c5
from contracts.c4_tensor_loader import load_tensor_c4
from contracts.c3_tensor_loader import load_tensor_c3


# Starts the inference computation.
@external
func predict{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr} () -> (
        out_dims_len : felt,
        out_dims : felt*,
        out_elements_len : felt,
        out_elements: felt*,
    ):

    alloc_locals

    # Read Tensors
    let (local c3_node) = load_tensor_c3()
    let (local c4_node) = load_tensor_c4()

    # Read inputs
    let (local zx) = load_tensor_c5()

    let permutation_1 : felt* = alloc()
    assert  [permutation_1] = 1
    assert  [permutation_1 + 1] = 2

    # Build graph
    let (mulx) = elem_x_elem_add(zx, c3_node)

    # TODO: Solve axis_sum memory issue
    # let (sumx) = axis_sum(mulx, permutation_1)
    # let (yhatlog) = elem_x_elem_mul(sumx, c4_node)

    let (yhatlog) = elem_x_elem_mul(mulx, c4_node)

    return (
        out_dims_len=yhatlog.dims_size,
        out_dims=yhatlog.dims,
        out_elements_len=yhatlog.elements_size,
        out_elements=yhatlog.elements,
    )
end