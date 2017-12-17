function [boundary] = generate_boundary( boundary, mesh )
	boundary.nodes = zeros(2, boundary.nums);
	boundary.nodes(1, :) = boundary.types;
	boundary.nodes(2, 1) = 1;
	boundary.nodes(2, 2) = length(mesh.pb);
end