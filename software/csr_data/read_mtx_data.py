# In this script, we read an input mtx matrix in COO format and write
# the data in the appropriate C header files to compile a static binary for 
# our RoCC accelerator

from scipy.io import mmread
import numpy as np
import sys

def generate_allocation_headers(file_path, nnz, nrows, ncols, ifndef_str):

    with open(file_path, 'w') as out_file:
        out_file.write('#ifndef ' + ifndef_str + '\n')
        out_file.write('#define ' + ifndef_str + '\n')
        out_file.write('int nnz = ' + str(nnz) + ';\n')
        out_file.write('int nrows = ' + str(nrows) + ';\n')
        out_file.write('int ncols = ' + str(ncols) + ';\n')
        out_file.write('float* nz = (float*) malloc(sizeof(float)*' + str(nnz) + ');\n')
        out_file.write('float* x = (float*) malloc(sizeof(float)*' + str(ncols) + ');\n')
        out_file.write('int* col_idx = (int*) malloc(sizeof(int)*' + str(nnz) + ');\n')
        out_file.write('int* row_ptr = (int*) malloc(sizeof(int)*' + str(nrows+1) + ');\n')
        out_file.write('#endif //' + ifndef_str + '\n')
    return

def print_assignment_statements(file_path, array_name_str, data, ifndef_str):
    with open(file_path, 'w') as out_file:
        # write header preamble
        out_file.write('#ifndef ' + ifndef_str + '\n')
        out_file.write('#define ' + ifndef_str + '\n')
        idx = 0
        for d in data:
            out_file.write('\t' + array_name_str + "[" + str(idx) + "]=" + str(d) + ';\n')
            idx += 1
        out_file.write('#endif //' + ifndef_str + '\n')
    return

# get the name of the input mtx file
mtx_file_path = sys.argv[1]
# read the input matrix
coo_mtx = mmread(mtx_file_path)

nrows = coo_mtx.get_shape()[0]
ncols = coo_mtx.get_shape()[1]
nnz = len(coo_mtx.data)
print(coo_mtx.get_shape())
print("Read matrix with nnz=" + str(nnz) + ", nrows=" + str(nrows) + ", ncols=" + str(ncols) + "\n")

#  convert to CSR
csr_matrix = coo_mtx.tocsr()
x_data = np.random.uniform(low=0.0, high=1.0, size=(ncols,))

generate_allocation_headers('csr_data_allocation.h', nnz, nrows, ncols, 'CSR_DATA_ALLOCATION_H')
print_assignment_statements('csr_nz_values.h', 'nz', csr_matrix.data, 'CSR_NZ_VALUES_H')
print_assignment_statements('csr_col_idx_values.h', 'col_idx', csr_matrix.indices, 'CSR_COL_IDX_VALUES_H')
print_assignment_statements('csr_row_ptr_values.h', 'row_ptr', csr_matrix.indptr, 'CSR_ROW_PTR_VALUES_H')
print_assignment_statements('csr_x_values.h', 'x', x_data, 'CSR_X_VALUES_H')

print("All done! Compile your binary!\n")

