----------------------------------------------------------
-- Licensed under the GNU General Public License version 2
--  * Copyright (C) 2009 Adrian C. <anrxc_sysphere_org>
----------------------------------------------------------

-- {{{ Grab environment
local io = { open = io.open }
-- }}}


-- Load: provides system load averages for the past 1, 5, and 15 minutes
module("vicious.load")


-- {{{ Load widget type
function worker(format)
    -- Get load averages
    local f = io.open('/proc/loadavg')
    local line = f:read()
    f:close()

    -- Get load data
    local avg1, avg5, avg15 = 
        line:match("([%d]*%.[%d]*)%s([%d]*%.[%d]*)%s([%d]*%.[%d]*)")

    return {avg1, avg5, avg15}
end
-- }}}