function x = parBEMNL (iel,psiFlag,x0,t0,             ...
                       Tar,Trg,Vg,wg,zr,ch,Lel,       ...
                       aoas,kfoils,foilwt,aoaz,aoast, ...
                       xas,yas,rho,A,Dia,omega)

Nel = size(Lel,1);
Neb = Nel/3;
ind = [iel Neb+iel 2*Neb+iel].';
i7 = 7*(ind-1);
i3 = 3*(ind-1);
i2 = 2*(ind-1);

ind7 = [i7(1)+[1:7] i7(2)+[1:7] i7(3)+[1:7]].';
ind3 = [i3(1)+[1:3] i3(2)+[1:3] i3(3)+[1:3]].';
ind2 = [i2(1)+[1:2] i2(2)+[1:2] i2(3)+[1:2]].';

[x,fvec,stat,outp,fjac] =                                ...
        fsolve ( @(xc) BEMNL (psiFlag,xc,t0,             ...
                              Tar(:,ind3),Trg,           ...
                              Vg(ind3),wg(ind3),         ...
                              zr(ind2),ch(ind),Lel(ind), ...
                              aoas,kfoils,foilwt(:,ind), ...
                              aoaz(ind),aoast(ind2),     ...
                              xas(ind),yas(ind),rho,     ...
                              A(ind),Dia,omega),x0(ind7));

if (stat ~= 1)  % Fsolve had problems with this element.
   % Use a robust and slow method.
   [xi,stat,msg] =                                          ...
          lsode (@(xc,tc) BEMNL (psiFlag,xc,t0,             ...
                                 Tar(:,ind3),Trg,           ...
                                 Vg(ind3),wg(ind3),         ...
                                 zr(ind2),ch(ind),Lel(ind), ...
                                 aoas,kfoils,foilwt(:,ind), ...
                                 aoaz(ind),aoast(ind2),     ...
                                 xas(ind),yas(ind),rho,     ...
                                 A(ind),Dia,omega),x0(ind7),[0:10:100]);
   x = xi(size(xi,1),:);
end

