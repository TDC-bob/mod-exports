dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.common_script_path.."ViewportHandling.lua")

indicator_type = indicator_types.COMMON
used_render_mask = LockOn_Options.script_path.."../Resources/IndicationTextures/SHKVAL_MASK.bmp"

if LockOn_Options.flight.easy_radar then    render_target_always = true
else                                        render_target_always = false    end

purposes = {--render_purpose.GENERAL,
render_purpose.HUD_ONLY_VIEW,
render_purpose.SCREENSPACE_OUTSIDE_COCKPIT,
render_purpose.SCREENSPACE_INSIDE_COCKPIT} 

update_screenspace_diplacement(115/78,true)
      
try_find_assigned_viewport("ED_KA50_Shkval")
							  
-------PAGE IDs-------
id_Page =
{
	PAGE_NULL = 0,
	PAGE_OFF  = 1,
	PAGE_TEST = 2,
	PAGE_MAIN = 3
}

id_pagesubset =
{
	COMMON  = 0,
	MAIN    = 1,
	TEST    = 2,
}

page_subsets = {}
page_subsets[id_pagesubset.COMMON] = LockOn_Options.script_path.."SHKVAL\\SHKVAL_base_page.lua"
page_subsets[id_pagesubset.MAIN]   = LockOn_Options.script_path.."SHKVAL\\SHKVAL_page.lua"
page_subsets[id_pagesubset.TEST]   = LockOn_Options.script_path.."SHKVAL\\SHKVAL_page_test.lua"
  	
----------------------
pages = {}
pages[id_Page.PAGE_MAIN] = { id_pagesubset.COMMON, id_pagesubset.MAIN}
pages[id_Page.PAGE_TEST] = { id_pagesubset.COMMON, id_pagesubset.TEST}

init_pageID     = id_Page.PAGE_MAIN
test_pageID     = id_Page.PAGE_TEST

always_show_ground = false
--use_parser      = false
