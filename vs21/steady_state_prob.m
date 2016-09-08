function vec_steady_state_prob = steady_state_prob (array,matrix)

D = diag(array); %transforma numa matriz diagonal
matrix = matrix - D;

number_of_states = numel (array);

vector_of_ones = ones (1,number_of_states);

matrix = [matrix; vector_of_ones];

vectorC = zeros (number_of_states, 1);

vectorC (number_of_states + 1) = 1;

vec_steady_state_prob = linsolve (matrix, vectorC); %vetor prob de estados.


