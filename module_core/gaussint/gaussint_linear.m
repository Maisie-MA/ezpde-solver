function [w_gauss, x_gauss] = gaussint_linear(a, b, order)
	% output w_, x_ as [nums x 1] column vector
	switch order
		case 2
			x = [-0.7745966692, 0.0000000000, 0.7745966692];
			w = [ 0.5555555556, 0.8888888888, 0.5555555556];
		case 3
			x = [-0.8611363116, -0.3399810436, 0.3399810436, 0.8611363116];
			w = [ 0.3478548461,  0.6521451549, 0.6521451549, 0.3478548461];
		case 4
			x = [-0.9061798459, -0.5384693101, 0.0000000000, 0.5384693101, ...
				  0.9061798459];
			w = [ 0.2369268851,  0.4786286705, 0.5688888889, 0.4786286705, ...
				  0.2369268851];
		case 5
			x = [-0.9324695142, -0.6612093865, -0.2386191761, 0.2386191761, ...
				  0.6612093865,  0.9324695142];
			w = [ 0.1713244924,  0.3607615730,  0.4679139346, 0.4679139346, ...
				  0.3607615730,  0.1713244924];
		case 6
			x = [-0.9491079123, -0.7415311856, -0.4058451514, 0.0000000000, ...
				  0.4058451514,  0.7415311856,  0.9491079123];
			w = [ 0.1294849662,  0.2797053915,  0.3818300505, 0.4179591837, ...
				  0.3818300505,  0.2797053915,  0.1294849662];
		case 7
			x = [-0.9602898566, -0.7966664774, -0.5255324099, -0.1834346425, ...
				  0.1834346425,  0.5255324099,  0.7966664774,  0.9602898566];
			w = [ 0.1012285363,  0.2223810345,  0.3137066459,  0.3626837834, ...
				  0.3626837834,  0.3137066459,  0.2223810345,  0.1012285363];
		otherwise
			error('out of function abilitity.');
	end
	g = @(t) ((b - a) / 2 * t);
	X = @(t) (g(t) + (b + a) / 2);
	w_gauss = g(w)';
	x_gauss = X(x)';
end