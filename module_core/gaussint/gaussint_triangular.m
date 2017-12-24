function [w_, x_, y_] = gaussint_triangular(x1, y1, x2, y2, x3, y3, order)
	% output w_, x_, y_ as [nums x 1] column vector
	if order >= 9 || order <= 0
		error('out of function abilitity.');
	end
	global gtc;
	xw = gtc.xw{order};
	x = xw(:, 1); y = xw(:, 2); w = xw(:, 3);
	jcb = (x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1);
	% f = @(a, b, c, x, y) (a + (b - a) * x + (c - a) * y);
	w_ = 0.5 * abs(jcb) * w;
	x_ = (x1 + (x2 - x1) * x + (x3 - x1) * y);
	y_ = (y1 + (y2 - y1) * x + (y3 - y1) * y);
end
%%% former gaussint_triangular.m
% function [w_, x_, y_] = gaussint_triangular(x1, y1, x2, y2, x3, y3, order)
% 	% output w_, x_, y_ as [nums x 1] column vector
% 	switch order
% 		case 1
% 			xw = [0.33333333333333 0.33333333333333 1.00000000000000];
% 		case 2
% 			xw = [0.00000000000000 0.50000000000000 0.33333333333333
% 				  0.50000000000000 0.00000000000000 0.33333333333333
% 				  0.50000000000000 0.50000000000000 0.33333333333333];
% 		case 3
% 			xw = [0.33333333333333 0.33333333333333 -0.56250000000000
% 				  0.20000000000000 0.20000000000000 0.52083333333333
% 				  0.20000000000000 0.60000000000000 0.52083333333333
% 				  0.60000000000000 0.20000000000000 0.52083333333333];
% 		case 4
% 			xw = [0.44594849091597 0.44594849091597 0.22338158967801
% 				  0.44594849091597 0.10810301816807 0.22338158967801
% 				  0.10810301816807 0.44594849091597 0.22338158967801
% 				  0.09157621350977 0.09157621350977 0.10995174365532
% 				  0.09157621350977 0.81684757298046 0.10995174365532
% 				  0.81684757298046 0.09157621350977 0.10995174365532];
% 		case 5
% 			xw = [0.33333333333333 0.33333333333333 0.22500000000000
% 				  0.47014206410511 0.47014206410511 0.13239415278851
% 				  0.47014206410511 0.05971587178977 0.13239415278851
% 				  0.05971587178977 0.47014206410511 0.13239415278851
% 				  0.10128650732346 0.10128650732346 0.12593918054483
% 				  0.10128650732346 0.79742698535309 0.12593918054483
% 				  0.79742698535309 0.10128650732346 0.12593918054483];
% 		case 6
% 			xw = [0.24928674517091 0.24928674517091 0.11678627572638
% 				  0.24928674517091 0.50142650965818 0.11678627572638
% 				  0.50142650965818 0.24928674517091 0.11678627572638
% 				  0.06308901449150 0.06308901449150 0.05084490637021
% 				  0.06308901449150 0.87382197101700 0.05084490637021
% 				  0.87382197101700 0.06308901449150 0.05084490637021
% 				  0.31035245103378 0.63650249912140 0.08285107561837
% 				  0.63650249912140 0.05314504984482 0.08285107561837
% 				  0.05314504984482 0.31035245103378 0.08285107561837
% 				  0.63650249912140 0.31035245103378 0.08285107561837
% 				  0.31035245103378 0.05314504984482 0.08285107561837
% 				  0.05314504984482 0.63650249912140 0.08285107561837];
% 		case 7
% 			xw = [0.33333333333333 0.33333333333333 -0.14957004446768
% 				  0.26034596607904 0.26034596607904 0.17561525743321
% 				  0.26034596607904 0.47930806784192 0.17561525743321
% 				  0.47930806784192 0.26034596607904 0.17561525743321
% 				  0.06513010290222 0.06513010290222 0.05334723560884
% 				  0.06513010290222 0.86973979419557 0.05334723560884
% 				  0.86973979419557 0.06513010290222 0.05334723560884
% 				  0.31286549600487 0.63844418856981 0.07711376089026
% 				  0.63844418856981 0.04869031542532 0.07711376089026
% 				  0.04869031542532 0.31286549600487 0.07711376089026
% 				  0.63844418856981 0.31286549600487 0.07711376089026
% 				  0.31286549600487 0.04869031542532 0.07711376089026
% 				  0.04869031542532 0.63844418856981 0.07711376089026];
% 		case 8
% 			xw = [0.33333333333333 0.33333333333333 0.14431560767779
% 				  0.45929258829272 0.45929258829272 0.09509163426728
% 				  0.45929258829272 0.08141482341455 0.09509163426728
% 				  0.08141482341455 0.45929258829272 0.09509163426728
% 				  0.17056930775176 0.17056930775176 0.10321737053472
% 				  0.17056930775176 0.65886138449648 0.10321737053472
% 				  0.65886138449648 0.17056930775176 0.10321737053472
% 				  0.05054722831703 0.05054722831703 0.03245849762320
% 				  0.05054722831703 0.89890554336594 0.03245849762320
% 				  0.89890554336594 0.05054722831703 0.03245849762320
% 				  0.26311282963464 0.72849239295540 0.02723031417443
% 				  0.72849239295540 0.00839477740996 0.02723031417443
% 				  0.00839477740996 0.26311282963464 0.02723031417443
% 				  0.72849239295540 0.26311282963464 0.02723031417443
% 				  0.26311282963464 0.00839477740996 0.02723031417443
% 				  0.00839477740996 0.72849239295540 0.02723031417443];
% 		otherwise
% 			xw = [0, 0, 0]; errbnd = 'out of function abilitity.';
% 			error(errbnd);
% 	end
% 	x = xw(:, 1); y = xw(:, 2); w = xw(:, 3);
% 	jcb = (x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1);
% 	f = @(a, b, c, x, y) (a + (b - a) * x + (c - a) * y);
% 	w_ = 0.5 * abs(jcb) * w;
% 	x_ = f(x1, x2, x3, x, y);
% 	y_ = f(y1, y2, y3, x, y);
% end
%%% gaussint_triangular_coefs.m
% xw{1} = [0.33333333333333 0.33333333333333 1.00000000000000];
% xw{2} = [0.00000000000000 0.50000000000000 0.33333333333333
% 		 0.50000000000000 0.00000000000000 0.33333333333333
% 		 0.50000000000000 0.50000000000000 0.33333333333333];
% xw{3} = [0.33333333333333 0.33333333333333 -0.56250000000000
% 		 0.20000000000000 0.20000000000000 0.52083333333333
% 		 0.20000000000000 0.60000000000000 0.52083333333333
% 		 0.60000000000000 0.20000000000000 0.52083333333333];
% xw{4} = [0.44594849091597 0.44594849091597 0.22338158967801
% 		 0.44594849091597 0.10810301816807 0.22338158967801
% 		 0.10810301816807 0.44594849091597 0.22338158967801
% 		 0.09157621350977 0.09157621350977 0.10995174365532
% 		 0.09157621350977 0.81684757298046 0.10995174365532
% 		 0.81684757298046 0.09157621350977 0.10995174365532];
% xw{5} = [0.33333333333333 0.33333333333333 0.22500000000000
% 		 0.47014206410511 0.47014206410511 0.13239415278851
% 		 0.47014206410511 0.05971587178977 0.13239415278851
% 		 0.05971587178977 0.47014206410511 0.13239415278851
% 		 0.10128650732346 0.10128650732346 0.12593918054483
% 		 0.10128650732346 0.79742698535309 0.12593918054483
% 		 0.79742698535309 0.10128650732346 0.12593918054483];
% xw{6} = [0.24928674517091 0.24928674517091 0.11678627572638
% 		 0.24928674517091 0.50142650965818 0.11678627572638
% 		 0.50142650965818 0.24928674517091 0.11678627572638
% 		 0.06308901449150 0.06308901449150 0.05084490637021
% 		 0.06308901449150 0.87382197101700 0.05084490637021
% 		 0.87382197101700 0.06308901449150 0.05084490637021
% 		 0.31035245103378 0.63650249912140 0.08285107561837
% 		 0.63650249912140 0.05314504984482 0.08285107561837
% 		 0.05314504984482 0.31035245103378 0.08285107561837
% 		 0.63650249912140 0.31035245103378 0.08285107561837
% 		 0.31035245103378 0.05314504984482 0.08285107561837
% 		 0.05314504984482 0.63650249912140 0.08285107561837];
% xw{7} = [0.33333333333333 0.33333333333333 -0.14957004446768
% 		 0.26034596607904 0.26034596607904 0.17561525743321
% 		 0.26034596607904 0.47930806784192 0.17561525743321
% 		 0.47930806784192 0.26034596607904 0.17561525743321
% 		 0.06513010290222 0.06513010290222 0.05334723560884
% 		 0.06513010290222 0.86973979419557 0.05334723560884
% 		 0.86973979419557 0.06513010290222 0.05334723560884
% 		 0.31286549600487 0.63844418856981 0.07711376089026
% 		 0.63844418856981 0.04869031542532 0.07711376089026
% 		 0.04869031542532 0.31286549600487 0.07711376089026
% 		 0.63844418856981 0.31286549600487 0.07711376089026
% 		 0.31286549600487 0.04869031542532 0.07711376089026
% 		 0.04869031542532 0.63844418856981 0.07711376089026];
% xw{8} = [0.33333333333333 0.33333333333333 0.14431560767779
% 		 0.45929258829272 0.45929258829272 0.09509163426728
% 		 0.45929258829272 0.08141482341455 0.09509163426728
% 		 0.08141482341455 0.45929258829272 0.09509163426728
% 		 0.17056930775176 0.17056930775176 0.10321737053472
% 		 0.17056930775176 0.65886138449648 0.10321737053472
% 		 0.65886138449648 0.17056930775176 0.10321737053472
% 		 0.05054722831703 0.05054722831703 0.03245849762320
% 		 0.05054722831703 0.89890554336594 0.03245849762320
% 		 0.89890554336594 0.05054722831703 0.03245849762320
% 		 0.26311282963464 0.72849239295540 0.02723031417443
% 		 0.72849239295540 0.00839477740996 0.02723031417443
% 		 0.00839477740996 0.26311282963464 0.02723031417443
% 		 0.72849239295540 0.26311282963464 0.02723031417443
% 		 0.26311282963464 0.00839477740996 0.02723031417443
% 		 0.00839477740996 0.72849239295540 0.02723031417443];
% save('gaussint_triangular_coefs.mat', 'xw');
