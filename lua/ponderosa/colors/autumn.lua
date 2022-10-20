local lush = require('lush')
local hsluv = lush.hsluv

local get = function()
    return {
        accent1 = hsluv(15, 75, 50),
        accent2 = hsluv(20, 75, 75),
        accent3 = hsluv(50, 70, 91),
        accent4 = hsluv(26, 75, 59),
        accent5 = hsluv(300, 65, 68),
        accent6 = hsluv(60, 65, 88),
        accent7 = hsluv(25, 50, 56),
        accent8 = hsluv(210, 55, 52),
        accent9 = hsluv(46, 55, 56),
        accent10 = hsluv(30, 85, 70),
        fg = hsluv(77, 65, 88),
        accent11 = hsluv(311, 60, 83),
        bg = hsluv(10, 85, 4),
        accent12 = hsluv(115, 65, 80),

        fg2 = hsluv(77, 65, 60),
        fg3 = hsluv(77, 65, 52),
        fg4 = hsluv(77, 65, 44),
        fg5 = hsluv(77, 65, 36),

        dark_bg = hsluv(10, 40, 4),
        bg2 = hsluv(10, 40, 15),
        bg3 = hsluv(10, 40, 20),
        bg4 = hsluv(10, 40, 25),
    }
end

return get
