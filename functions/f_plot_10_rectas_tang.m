function [] = f_plot_10_rectas_tang(fx, x0,I)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%===============INPUT=================
%   fx: funcion para usar el metodo
%   x0: x inicial
%   I: intervalo en el que se evaluan
%       las rectas tangentes
%===============OUTPUT================
%   graficas de las 10 primeras iteraciones
%===============AUTOR=================
%   Estefania Laverde
%=====================================

    
    syms x      %x simbolica para evaluar la recta tangente
    colors = ['r','g','b','k','y','c','m','r','g','m','k'];     %Colores de las graficas
    xtemp = x0;     %x que cambia
    fdiff = diff(fx);   %Primera derivada

    for k =1:1:10       
        
        %Evaluo la derivada y la funcion en xn
        fxtemp = double(subs(fx,'x',xtemp));
        fdiffxtemp = double(subs(fdiff,'x',xtemp));

        %Guardo la recta tangente
        y = fdiffxtemp*(x-xtemp)+fxtemp;

        %Guardo el nuevo valor de xn+1
        xanterior = xtemp;
        xtemp = double(xtemp-(fxtemp/fdiffxtemp));

        %Plot del xn y de y
        plot(I,subs(y,'x',I),"Color",colors(k))
        hold on
        plot(xanterior,fxtemp,'o','Color',colors(k),'HandleVisibility','off','MarkerFaceColor',colors(k),LineWidth=1.5)
        grid on
        xlabel('x')
        ylabel('y')
        title('Aproximaciones con el método de Newton-Raphson')
        hold on
    end
    hold off
end



