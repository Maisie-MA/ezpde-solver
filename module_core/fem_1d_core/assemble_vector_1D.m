function [vec] = assemble_vector_1D( meshes, basis_config, coef_fun, diff_order )
	d = diff_order;
	point_nums = length(meshes.pb);
	element_nums = length(meshes.t);
	local_basis_nums = basis_config.nums;
	vec = zeros(point_nums, 1);

	for n = 1 : element_nums
		v = meshes.p(:, meshes.t(:, n));
		for jj = 1 : local_basis_nums
			integral_r = calc_intgl(v, [0, jj], coef_fun, basis_config, d);
			vec(meshes.tb(jj, n), 1) = vec(meshes.tb(jj, n), 1) + integral_r;
		end
	end

end