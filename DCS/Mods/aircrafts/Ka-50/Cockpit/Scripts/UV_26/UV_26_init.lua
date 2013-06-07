dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.common_script_path.."ViewportHandling.lua")

indicator_type = indicator_types.COMMON

function set_full_viewport_coverage(viewport)

   dedicated_viewport          = {viewport.x,
                                viewport.y,
                                viewport.width,
                                viewport.height}
   dedicated_viewport_arcade = dedicated_viewport
   purposes                  = {render_purpose.GENERAL,
                                render_purpose.HUD_ONLY_VIEW,
                                render_purpose.SCREENSPACE_OUTSIDE_COCKPIT,
                                render_purpose.SCREENSPACE_INSIDE_COCKPIT} -- set purposes to draw it always 
   render_target_always = true
end

-- try to find assigned viewport
local multimonitor_setup_name =  "Config/MonitorSetup/"..get_multimonitor_preset_name()..".lua"
local env = {}
      env.screen = LockOn_Options.screen
local f = loadfile(multimonitor_setup_name)
if      f     then
      setfenv(f,env)
      pcall(f)
      
      local vp = nil
      vp = env.ED_KA50_UV26
      
      if vp ~= nil then
         dbg_print("ok we have directly assigned viewport to MFCD\n")
         set_full_viewport_coverage(vp)
      end       
end
-------PAGE IDs-------
id_Page =
{
	PAGE_NULL = 0,
	PAGE_OFF  = 1,
	PAGE_MAIN = 2
}

id_pagesubset =
{
	MAIN   = 0
}

page_subsets = {}
page_subsets[id_pagesubset.MAIN]   = LockOn_Options.script_path.."UV_26\\UV_26_page.lua"
  	
----------------------
pages = {}
pages[id_Page.PAGE_MAIN] = {id_pagesubset.MAIN}

init_pageID     = id_Page.PAGE_MAIN

