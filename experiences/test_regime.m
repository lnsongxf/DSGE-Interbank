
load imperfect_xp_sol

disp('-----------------Test for a given deviation from s_rss --------------------')

gamma=1
disp('-------States----------')
s=rule.s_rss';
s(1)=s(1)*gamma;
disp(model.states);
disp(s);

disp('----------Controls---------')
disp(model.controls);
x=funeval(rule.coeff,rule.cdef,s);
disp(x)

disp('-----------Auxiliaries------------')
inu_rat=strmatch('nu_rat',model.auxiliaries,'exact');
inu_strat=strmatch('nu_strat',model.auxiliaries,'exact');
inu_star=strmatch('nu_star',model.auxiliaries,'exact');
irat=strmatch('rat',model.auxiliaries,'exact');
iperfect=strmatch('perfect',model.auxiliaries,'exact');
ipro_B=strmatch('pro_B',model.auxiliaries,'exact');
ipro_def=strmatch('pro_def',model.auxiliaries,'exact');
%disp(model.auxiliaries);
aux=model.a(s,x,model.params);
%disp(aux)
aux(:,inu_rat)
aux(:,inu_strat)
aux(:,inu_star)
aux(:,irat)
aux(:,iperfect)
aux(:,ipro_B)-aux(:,ipro_def)






disp('-----------------Test on the hole grid --------------------')
inu_rat=strmatch('nu_rat',model.auxiliaries,'exact');
inu_strat=strmatch('nu_strat',model.auxiliaries,'exact');
inu_rat=strmatch('nu_rat',model.auxiliaries,'exact');
inu_strat=strmatch('nu_strat',model.auxiliaries,'exact');
inu_star=strmatch('nu_star',model.auxiliaries,'exact');
irat=strmatch('rat',model.auxiliaries,'exact');
iperfect=strmatch('perfect',model.auxiliaries,'exact');
ipro_B=strmatch('pro_B',model.auxiliaries,'exact');
ipro_def=strmatch('pro_def',model.auxiliaries,'exact');

aux=model.a(grid.grid,rule.x,model.params);

mean(aux(:,iperfect))
mean(aux(:,irat))

ivartheta=strmatch('vartheta',model.parameters,'exact');


disp('-----------------Plot the regime-------------------------')
% 
% close all
% k=[5:0.1:25];
% m=[0.5:0.1:3];
% 
% nk=length(k);
% nm=length(m);
% 
% ns=length(model.states);
% nx=length(model.controls);
% naux=length(model.auxiliaries);
% 
% s=zeros(nm*nk,ns);
% x=zeros(nx,nm,nk);
% aux=zeros(naux,nm,nk);
% for i=1:nk;
%     for j=1:nm;
%         x(:,j,i)=funeval(rule.coeff,rule.cdef,[k(i),m(j),(1+model.params(4))*m(j),0,0]);
%         a=model.a([k(i),m(j),(1+model.params(4))*m(j),0,0], x(:,j,i)',model.params);
%         aux(:,j,i)=a';
%     end;
% end;
% 
% z=squeeze(aux(22,:,:));
% mesh(k,m,z);
% 
% 



