Delimiter //
create procedure myProc()
Begin
	Select * from member where member_name='hoona';
	select * from product where product_name='samk';
end //
Delimiter ;
Call myProc() ;
Drop procedure myProc ;