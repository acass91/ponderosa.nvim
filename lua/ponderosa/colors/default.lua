local lush = require('lush')
local hsluv = lush.hsluv

local get = function()
    return {
        accent1 = hsluv(54, 100, 50),
        accent2 = hsluv(130, 79, 80),
        accent3 = hsluv(110, 100, 91),
        accent4 = hsluv(26, 52, 59),
        accent5 = hsluv(32, 50, 68),
        accent6 = hsluv(77, 100, 88),
        accent7 = hsluv(16, 100, 56),
        accent8 = hsluv(286, 100, 52),
        accent9 = hsluv(260, 100, 56),
        accent10 = hsluv(235, 100, 80),
        fg = hsluv(247, 2, 95),
        accent11 = hsluv(253, 81, 83),
        bg = hsluv(130, 65, 20),
        accent12 = hsluv(60, 60, 80),

        fg2 = hsluv(247, 2, 87),
        fg3 = hsluv(247, 2, 71),
        fg4 = hsluv(247, 2, 55),
        fg5 = hsluv(247, 2, 39),

        dark_bg = hsluv(130, 65, 14),
        bg2 = hsluv(130, 65, 26),
        bg3 = hsluv(130, 65, 32),
        bg4 = hsluv(130, 65, 36),
    }
end

return get
