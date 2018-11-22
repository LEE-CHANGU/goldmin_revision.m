# goldmin_revision.m
![image](https://user-images.githubusercontent.com/44903476/48918841-8c593700-eed2-11e8-932d-4ec45b0256c1.png)
수치해석 과제로 주어진 이 문제를 matlab을 이용하여 해결해보았습니다.

````
function [x,fx,iter]=goldmin_revision(f,xl,xu,maxit,varargin)
````
- 우선 goldmin_revision이라는 함수를 만들었습니다. f라는 함수와 xl,xu,maxit 및 나머지 변수들 varargin을 입력 받습니다. f라는 함수에서 xl과 xu사이의 최소값을 maxit의 횟수만큼 반복하여 추정하도록 하는 함수입니다.

````
if nargin<3,error('at least 3 input arguments required'),end
if nargin<4|isempty(maxit), maxit=50;end
````
- 입력된 변수가 3개 미만이면 'at least 3 input arguments required' 즉 적어도 세개이상의 입력 변수를 필요로 한다는 메세지를 띄우게 하였습니다. 또한 입력변수가 4개 미만이거나 maxit자리가 비어있으면 maxit가 기본 값 50을 갖도록 하였습니다. 

````
phi=(1+sqrt(5))/2;
d = (phi-1)*(xu-xl);
x1 = xl + d; fx1 = f(x1,varargin{:});
x2 = xu - d; fx2 = f(x2,varargin{:});
iter=0;
````
- 황금비와 초기값(xl, xu)을 이용하여 두개의 추정치 x1, x2를 구하도록 하였습니다.
````
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
````    
- while문을 이용하여 반복하였습니다. 조건문이 들어갈 자리에 '1'을 입력하여 break를 만나기 전까지 계속 반복되도록 하였습니다. f1의 값이 f2의 값보다 작으면 xmin을 x1으로, 최소값 min을 fx1으로 대체하도록 하였습니다. 그리고 구간을 새로 설정 하여 반복해서 추정하도록 하였습니다.
````
iter = iter+1;
    if iter>=maxit, break; end;
end
x = xmin; fx = min;
````
- 그리하여 반복횟수가 maxit에 도달하면 break를 만나서 while문이 종료되어 추정을 멈추도록 하였습니다.
