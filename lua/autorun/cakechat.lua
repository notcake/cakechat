if SERVER or
   file.Exists ("cakechat/cakechat.lua", "LUA") or
   file.Exists ("cakechat/cakechat.lua", "LCL") and GetConVar ("sv_allowcslua"):GetBool () then
	include ("cakechat/cakechat.lua")
end