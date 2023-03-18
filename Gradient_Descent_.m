f = @(x) 100*(x(2) -x(1))^2 + (1-x(1))^2; % Rosenbrock Function 
x = [-1;5]; % Initial point
values = f(x);
points = x; % all succesive points are stored here 
step_length = 0.00125; % step length 
grad = @(x) [202.*x(1)-200.*x(2)-2; 200.*x(2)- 200.*x(1)]; % gradient of the rosenbrock function 
while (norm(grad(x))>=10^-5)
    x = x - step_length*grad(x);
    points = [points,x];
    values = [values,f(x)];
end

fprintf("The minimum point is :")
display(x)
figure
plot(points(1,:),points(2,:),'ro')
hold on
[X ,Y] = meshgrid(-5:0.2:5);
Z = 100.*(Y-X.^2)+(1-X).^2;
contour(X,Y,Z);
hold off
figure
[P, Q] = meshgrid(-5:0.2:5);
R = 100.*(Q-P.^2).^2+(1-P).^2;
surf (P,Q,R);
hold on 
plot3(points(1,:),points(2,:),values,'r*');