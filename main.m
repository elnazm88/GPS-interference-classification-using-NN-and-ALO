
clear all
clc

SearchAgents_no=40; 

Function_name='F17'; 

Max_iteration=500;

[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Best_score,Best_pos,cg_curve]=ALO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

% figure('Position',[500 500 660 290])
% %test function
% subplot(2,1,1);
% func_plot(Function_name);
% title('Test function')
% xlabel('x_1');
% ylabel('x_2');
% zlabel([Function_name,'( x_1 , x_2 )'])
% grid off
% 
% % objective 
% subplot(2,1,2);
% semilogy(cg_curve,'Color','r')
% title('Convergence curve')
% xlabel('Iteration');
% ylabel('Best score obtained so far');
% 
% axis tight
% grid off
% box on
% legend('ALO')
% 
% display(['The best solution obtained by ALO is : ', num2str(Best_pos)]);
% display(['The best optimal value of the objective funciton found by ALO is : ', num2str(Best_score)]);

        
zarayeb_train_dataset5=Best_pos;
save zarayeb_train_dataset5 zarayeb_train_dataset5

save cg_curve cg_curve
