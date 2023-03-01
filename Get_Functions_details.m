
function [lb,ub,dim,fobj] = Get_Functions_details(F)


switch F
       
    case 'F17'
        fobj = @F17;
%         lb=[-10,-10];
%         ub=[10,10];
%         dim=2;
        
        dim=28;
        lb1=[-1];
        lb=repmat(lb1,1,dim);
        ub1=[1];
        ub=repmat(ub1,1,dim);
        
end

end

% function o = F17(x)
% o=x(1)*sin(4*x(2))+1.1*x(2)*sin(2*x(2));
% end
% 

