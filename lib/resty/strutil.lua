local _M = { _VERSION="1.0.0"};


function _M:split(split, str)
	local str_split_tab = {}
	while true do
		local idx = string.find(str,split,1,true);
		if nil~=idx then
			local insert_str = '';
			if 1==idx then
				insert_str = string.sub(str, 1,idx + #split - 1);
			else
				insert_str = string.sub(str, 1,idx - 1);
			end

			if (insert_str ~= split) and (nil ~= insert_str or '' ~= insert_str) then
				table.insert(str_split_tab,insert_str);
			end
			str = string.sub(str,idx + #split,-1);
		else
			if nil ~= str or '' ~= str then
				table.insert(str_split_tab,str);
			end
			break;
		end
	end
	return str_split_tab;
end


function _M:replace(str, find, replace)
	local res,res_count = string.gsub(str,find,replace);
	return res,res_count
end


function _M:trim(str)
	str = _M:trim_left( str );
	str = _M:trim_right( str );
	return str;
end


function _M:trim_left( str )
	if ''==str or nil==str then
		return str;
	end
	local len = string.len( str );
	
	local substart = 1;
	local  lenadd = 1;
	while ( string.find ( str," ",lenadd) == lenadd ) do
		substart = substart + 1;
		lenadd= lenadd + 1;
	end
	

	str=string.sub ( str ,substart ,len);
	
	local substart1 = 1;
	local lenadd1 = 1;
	len=string.len(str);
	while(string.find(str,"%s",lenadd1 )==lenadd1) do
        		substart1 = substart1 +1
        		lenadd1 = lenadd1 +1
	end
	
	str=string.sub(str,substart1,len);
	
	return str;
end


function _M:trim_right( str )
	if ''==str or nil==str then
		return str;
	end
	local len = string.len(str);
	
	
	
	local substart = len;
	local  lenadd = len;
	while ( string.find ( str,"%s",lenadd) == lenadd ) do
		substart = substart - 1;
		lenadd= lenadd - 1;
	end
	str =string.sub(str , 1,substart );
	len=string.len(str);

	local substart1 = len;
	local lenadd1 = len;
	while(string.find(str," ",lenadd1 )==lenadd1) do
        		substart1 = substart1 -1
        		lenadd1 = lenadd1 -1
	end
	
	str=string.sub(str,1,substart);

	return str;

end


function _M:upper(str)
	if ''==str or nil==str then
		return str;
	end
	return string.upper(str);
end


function _M:lower(str)
	if ''==str or nil==str then
		return str;
	end
	return string.lower(str);
end


return _M;