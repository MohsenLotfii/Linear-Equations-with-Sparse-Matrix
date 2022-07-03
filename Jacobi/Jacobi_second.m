%*************************Eric Douglas*****************************%
%***********************August 30th, 2013**************************%
%This code is used to compute the Jacobi Method of a certain matrix.%
%Input:
%       C_n = convergence criteria value
%       N = number of equations in the matrix
%       Imax = the maximum number of iterations
%Output:
%       S = the solution( M x 1 matrix ; jacobi approximation)
%       j = the number of iterations it took to
%           converge to the user inputed value
%       R = Residual Values

%establishes the variables needed
%B is an M x 1 matrix
%A is an M x M matrix
%P is the initial M x 1 matrix
%Z = remembering matrix

K = 0;%Initialize K to be 0
Z = K;%receives value from the previous matrix iterations

%Ask the user for each input statement required
Imax = input('What do you want the maximum iteration to be? ');
N = input('How many equations do you want? ');
C_n = input('What value do you want to converge to? ');
sprintf('A is a %d x %d matrix',N,N);
L2 = 100;%Initializes L2 norm to be something larger than C_n

%Assigns the values inputed by the user into the matrices
for x=1:1:N
    for y=1:1:N
        strA = ['What do you desire your numbers in the matrix to be? ' num2str(x) 'Row: ' num2str(y) 'Column: '];
        A = input(strA);
    end
end
for l=1:1:N
    strB = ('What do you desire the Solution matrix to be? ');
    B = input(strB);
end

S = P;%Solution starts at the initial value given
P = zeros(N,1);%Initializes the first guess at N x 1 matrix of zeros
M = length(B);%tells the program the amount of iterations to perform

while j<Imax && L2>C_n

      for j=1:1:Imax,%loops until Imax is reached
          for i=1:1:M,%loops until M; M is the value it takes to get there
              S(M,1)=(B(i,1)-A(i,[1:j-1,j+1:M])*P([1:j-1,j+1:M],1))/A(i,i);
              Pn(M,1) = S(i,1);
          end

          P = Pn;%Assigns new Initialization value to compute the next it
          R = A*S-B;%Assigns Ax - B residuals

          %computes the Convergence criteria
          for k=1:1:M
              L2 = R(k)^2;
          end

          %computes the Convergence criteria
          for i=1:1:M
              L2= L2 + (R(i)^2);
          end

          %Loops to check L2 is still greater than the user inputed value
          if(L2<C_n)
              if(j<=Imax)
                  break
              end
              S = S^(j+1);
          end
      end
      break
  end

j
S
