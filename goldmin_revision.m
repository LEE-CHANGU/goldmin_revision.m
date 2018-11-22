function [x,fx,iter]=goldmin_revision(f,xl,xu,maxit,varargin)

if nargin<3,error('at least 3 input arguments required'),end
if nargin<4|isempty(maxit), maxit=50;end
phi=(1+sqrt(5))/2;
d = (phi-1)*(xu-xl);
x1 = xl + d; fx1 = f(x1,varargin{:});
x2 = xu - d; fx2 = f(x2,varargin{:});
iter=0;
while(1)
    if fx1<fx2
        xmin = x1; min = fx1;
        x1 = x2;
        x2 = x1; fx2 = fx1;
        d = xu-x2;
        x1 = xl+d; fx1=f(x1,varargin{:});
    else
        xmin = x2; min = fx2;
        xu = x1;
        x1 = x2; fx1 = fx2;
        d = x1-xl;
        x2 = xu-d; fx2=f(x2,varargin{:});
    end
    iter = iter+1;
    if iter>=maxit, break; end;
end
x = xmin; fx = min;
