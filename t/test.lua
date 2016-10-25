local strutil=require "resty.strutil"

local str_en="   When Miss Emily Grierson died, our whole town went to her funeral: the men through a sort ofrespectful affection for a fallen monument, the women mostly out of curiosity to see the inside ofher house, which no one save an old manservant---a combined gardener and cook-had seen in atleast ten years.    ";
local str_cn="  爱米丽•格里尔生小姐过世了，全镇的人都去送丧：男子们是出于敬慕之情，因为一个纪念碑倒下了：妇女们呢，则大多数出于好奇心，想看看她屋子的内部。除了一个花匠兼厨师的老仆人之外，至少已有十年光景谁也没进去看看这幢房子了。   ";
local str = "";

ngx.say(str_en);
ngx.say(str_cn);
--replace
ngx.say('test-----------------replace')
str = strutil:replace(str_en,"and","111");
ngx.say(str);
str = strutil:replace(str_cn,"了","嘞");
ngx.say(str);

--trim
ngx.say('');
ngx.say('test-----------------trim_left-----trim_right------trim')
str = strutil:trim_left(str_en);
ngx.say(str);

str = strutil:trim_right(str_en);
ngx.say(str);

local str = strutil:trim(str_en);
ngx.say(str);

--split
ngx.say('');
ngx.say('test-----------------split');
local str_tab = strutil:split(" ", str_en);
ngx.say(table.concat(str_tab, " ||| "));


-- toupper
ngx.say("");
ngx.say("test-----------------toupper");
str = strutil:upper(str_en);
ngx.say(str);


--tolower
ngx.say("");
ngx.say("test-----------------tolower");
str = strutil:lower(str_en);
ngx.say(str)




ngx.exit(0);