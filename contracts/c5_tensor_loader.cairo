
from starkware.cairo.common.alloc import alloc

from contracts.onnx_cairo.tensor_data_types import (
    Tensor,
    init_tensor
)

func load_tensor_c5() -> (res: Tensor):
    alloc_locals
    let (dims: felt*) = alloc()
    
    assert ([dims]) = 2
    assert ([dims + 1]) = 3
    assert ([dims + 2]) = 4

    let (elements: felt*) = alloc()
    assert ([elements]) = 1
    assert ([elements + 1]) = 2
    assert ([elements + 2]) = 3
    assert ([elements + 3]) = 4
    assert ([elements + 4]) = 5
    assert ([elements + 5]) = 6
    assert ([elements + 6]) = 7
    assert ([elements + 7]) = 8
    assert ([elements + 8]) = 11
    assert ([elements + 9]) = 12
    assert ([elements + 10]) = 13
    assert ([elements + 11]) = 14
    assert ([elements + 12]) = 15
    assert ([elements + 13]) = 16
    assert ([elements + 14]) = 17
    assert ([elements + 15]) = 18
    assert ([elements + 16]) = 21
    assert ([elements + 17]) = 22
    assert ([elements + 18]) = 23
    assert ([elements + 19]) = 24
    assert ([elements + 20]) = 25
    assert ([elements + 21]) = 26
    assert ([elements + 22]) = 27
    assert ([elements + 23]) = 28

    let (res: Tensor) = init_tensor (3, dims, 24, elements)
    return (res = res)
end
