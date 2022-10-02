local lush = require('lush')
local hsluv = lush.hsluv

local get = function()
    return {
        accent1 = hsluv(130, 50, 50),
        accent2 = hsluv(130, 45, 80),
        accent3 = hsluv(110, 50, 91),
        accent4 = hsluv(26, 65, 59),
        accent5 = hsluv(32, 65, 68),
        accent6 = hsluv(77, 65, 88),
        accent7 = hsluv(16, 50, 56),
        accent8 = hsluv(286, 28, 52),
        accent9 = hsluv(260, 28, 56),
        accent10 = hsluv(235, 28, 80),
        fg = hsluv(32, 35, 68),
        accent11 = hsluv(253, 60, 83),
        bg = hsluv(70, 50, 10),
        accent12 = hsluv(60, 65, 80),

        fg2 = hsluv(32, 35, 60),
        fg3 = hsluv(32, 35, 52),
        fg4 = hsluv(32, 35, 44),
        fg5 = hsluv(32, 35, 36),

        dark_bg = hsluv(70, 40, 5),
        bg2 = hsluv(70, 40, 15),
        bg3 = hsluv(70, 40, 20),
        bg4 = hsluv(70, 40, 25),
    }
end

return get
