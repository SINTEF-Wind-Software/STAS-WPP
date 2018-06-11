function gdofs = getgdofs (idofs,idofm,Ndj)

% Here are the 72 elements of q that are active in the constraint
% equations, and against which partial derivatives are taken.
gdofs = [idofs(1)+[4:6] idofm(2)+[1:6] idofs(2)+[4:6] idofm(3)+[1:6] ...
         idofs(3)+[4:6] idofm(4)+[1:6] idofs(4)+[4:6] idofm(5)+[1:6] ...
         idofs(5)+[1:3] idofm(6)+[1:6] idofs(6)+[4:6] idofm(7)+[1:6] ...
         idofs(7)+[4:6] idofm(8)+[1:6] idofs(8)+[4:6] [Ndj-5:Ndj]].';