if CakeChat then return end
CakeChat = CakeChat or {}

include ("glib/glib.lua")

GLib.Initialize ("CakeChat", CakeChat)
GLib.AddCSLuaPackSystem ("CakeChat")
GLib.AddCSLuaPackFile ("autorun/cakechat.lua")
GLib.AddCSLuaPackFolderRecursive ("cakechat")

include ("chatstream.lua")
include ("chatstreamtype.lua")
include ("chatmessage.lua")
include ("chatmessagetype.lua")
include ("defaultchatstream.lua")

CakeChat:DispatchEvent ("Initialize")

CakeChat.AddReloadCommand ("cakechat/cakechat.lua", "cakechat", "CakeChat")