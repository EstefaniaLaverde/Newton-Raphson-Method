function [T] = f_newton_raphson(fx, x0, n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%===============INPUT=================
%   fx: funcion para usar el metodo
%   x0: x inicial
%   n: numero de iteraciones
%===============OUTPUT================
%   T: tabla con la informacion de las 
%       iteraciones
%===============AUTOR=================
%   Estefania Laverde
%=====================================

    format long     %Para que se muestren más decimales

    tabla = [];     %Tabla para guardar los datos
    xtemp = x0;     %x que cambia
    fdiff = diff(fx);   %Primera derivada

    for k =1:1:n       
        
        %Evaluo la derivada y la funcion en xn
        fxtemp = double(subs(fx,'x',xtemp));
        fdiffxtemp = double(subs(fdiff,'x',xtemp));

        %Guardo el nuevo valor de xn+1
        xanterior = xtemp;
        xtemp = double(xtemp-(fxtemp/fdiffxtemp));

        %Agrego la info a la matriz
        tabla = vertcat(tabla,[k xanterior fxtemp fdiffxtemp xtemp]);
        
    end

    %Convierto la matriz en tabla
    T = array2table(tabla,"VariableNames",{'k','xn','f(x0)','f´(x0)','xn+1'});
end

