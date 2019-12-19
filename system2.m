function y = system2(x)

x1 = x(1);
x2 = x(2);

mi_du1 = trapez(x1, -180, -180, -80, -60);
mi_mu1 = trojkat(x1, -80, -40, 0);
mi_oz1 = trojkat(x1, -5, 0, 5);
mi_md1 = trojkat(x1, 0, 40, 80);
mi_dd1 = trapez(x1, 60, 80, 180, 180);
mi_du2 = trapez(x2, -10/60,-10/60, -7/60, -4/60);
mi_mu2 = trojkat(x2, -8/60, -4/60, 0);
mi_oz2 = trojkat(x2, -2/60, 0, 2/60);
mi_md2 = trojkat(x2, 0, 4/60, 8/60);
mi_dd2 = trapez(x2, 4/60, 7/60, 10/60, 10/60);
d_ujemny = -20;
m_ujemny = -10;
oz = 0;
m_dodatni = 10;
d_dodatni = 20;

% dla oz
mi_oz =     max([ min(mi_dd1,mi_du2) min(mi_md1,mi_mu2) min(mi_oz1,mi_oz2)...
                  min(mi_mu1,mi_md2) min(mi_du1,mi_dd2)]);

% dla niski
mi_d_ujemny =  max([ min(mi_du1,mi_du2) min(mi_mu1,mi_du2) min(mi_du1,mi_mu2)...
                     min(mi_du1, mi_oz2)]);

% dla sredni
mi_m_ujemny = max([ min(mi_oz1,mi_du2) min(mi_md1,mi_du2) min(mi_mu1,mi_mu2)...
                    min(mi_oz1,mi_mu2) min(mi_mu1,mi_oz2) min(mi_du1,mi_md2)...
                    min(mi_mu1,mi_dd2)]);

% dla duzy
mi_m_dodatni = max([ min(mi_dd1,mi_mu2) min(mi_md1,mi_oz2) min(mi_oz1,mi_md2)...
                    min(mi_md1,mi_md2) min(mi_oz1,mi_dd2)]);
mi_d_dodatni = max([ min(mi_dd1,mi_oz2) min(mi_dd1,mi_md2) min(mi_md1,mi_dd2)...
                    min(mi_dd1,mi_dd2)]);
suma = mi_oz + mi_d_ujemny + mi_m_ujemny + mi_m_dodatni + mi_d_dodatni;

if suma==0
   y = 0;
else 
   y = (oz*mi_oz + d_ujemny*mi_d_ujemny + m_ujemny*mi_m_ujemny...
        + m_dodatni*mi_m_dodatni + d_dodatni*mi_d_dodatni)/suma;
end
