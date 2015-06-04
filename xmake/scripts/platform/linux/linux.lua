--!The Automatic Cross-platform Build Tool
-- 
-- XMake is free software; you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation; either version 2.1 of the License, or
-- (at your option) any later version.
-- 
-- XMake is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public License
-- along with XMake; 
-- If not, see <a href="http://www.gnu.org/licenses/"> http://www.gnu.org/licenses/</a>
-- 
-- Copyright (C) 2009 - 2015, ruki All rights reserved.
--
-- @author      ruki
-- @file        linux.lua
--

-- define module: linux
local linux = linux or {}

-- load modules
local config    = require("base/config")

-- init host
linux._HOST    = "linux"

-- init architectures
linux._ARCHS   = {"x86", "x64"}

-- make configure
function linux.make(configs)

    -- init the file formats
    configs.formats = {}
    configs.formats.static = {"lib", ".a"}
    configs.formats.object = {"",    ".o"}
    configs.formats.shared = {"lib", ".so"}
end

-- get the option menu for action: xmake config or global
function linux.menu(action)

    -- init config option menu
    linux._MENU_CONFIG = linux._MENU_CONFIG or
            {   {}
            ,   {nil, "ar",         "kv", nil,          "The Library Creator"           }
            ,   {nil, "arflags",    "kv", nil,          "The Library Creator Flags"     }
            }

    -- init global option menu
    linux._MENU_GLOBAL = linux._MENU_GLOBAL or {}

    -- get the option menu
    if action == "config" then
        return linux._MENU_CONFIG
    elseif action == "global" then
        return linux._MENU_GLOBAL
    end
end

-- return module: linux
return linux