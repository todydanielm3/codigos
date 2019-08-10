function I = conv2(X)

T = inv([1.0 0.956 0.621; 1.0 -0.272 -0.647; 1.0 -1.106 1.703]);
  coef = T(1,:);
  I = X * coef';
  I = min(max(I,0),1);
  I = [I,I,I];
end

%ENTRADA
function [X, threeD] = parse_inputs(X)
threeD = (ndims(X)==3);
if (threeD)
    if ((size(X,3) ~= 3))
      error(message('MATLAB:images:convert:invalidInputSizeRGB'))
    end
elseif ismatrix(X)
  if (size(X,2) ~=3 || size(X,1) < 1)
    error(message('MATLAB:images:convert:invalidSizeForColormap'))
  end
  if ~isa(X,'double')
    error(message('MATLAB:images:convert:notAValidColormap'))
  end
else
  error(message('MATLAB:images:convert:invalidInputSize'))
end