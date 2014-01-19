-- node crated with NodeBoxEditor --

-- found  here https://forum.minetest.net/viewtopic.php?id=2840 --

-- code by Semmett9 / Infinitum --

minetest.register_on_placenode(function (pos, newnode, placer, oldnode, itemstack)
	
	pos.y = pos.y+1
	local nodeover = minetest.env:get_node(pos)
	local name2 = nodeover.name
	pos.y = pos.y-2
	local nodeunder = minetest.env:get_node(pos)
	local name = nodeunder.name
	
	if name ~= "air" and newnode.name == "default:torch" then
		if name ~= "3d_torch:torch_floor" and name ~= "default:torch" then
		pos.y = pos.y+1
		minetest.env:remove_node(pos)
		pos.y = pos.y+1
		minetest.env:place_node(pos, {name="3d_torch:torch_floor"})
		return
		end
	end
	
	-- this is for the torches to be on the roof --
	-- this is removed because its silly 
	
	--if name2 ~= "air" and newnode.name == "default:torch" then
	--	if name2 ~= "default:torch" then
	--	if name2 ~= "3d_torch:torch_ceiling" then
	--	if name == "air" or name == "default:torch" or name == "3d_torch:torch_floor"then
	--	pos.y = pos.y+1
	--	minetest.env:remove_node(pos)
	--	pos.y = pos.y+1
	--	minetest.env:place_node(pos, {name="3d_torch:torch_ceiling"})
	--	return
	--	end
	--	end
	--	end
	--end
end
)


minetest.register_node("3d_torch:torch_wall",{
	tiles = {"3d_torch_torch_top.png","3d_torch_torch_top.png","3d_torch_torch_1.png","3d_torch_torch_1.png","3d_torch_torch_2.png","3d_torch_torch.png"},
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	light_source = 30,
	is_ground_content = true,
	walkable = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {oddly_breakable_by_hand = 1}, 
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.409091,-0.0625,-0.375,-0.362669,0.0625}, --NodeBox1
			{-0.484526,-0.362669,-0.0638297,-0.359768,-0.319149,0.0638297}, --NodeBox2
			{-0.348163,-0.281431,-0.0638297,-0.470019,-0.32205,0.0638297}, --NodeBox3
			{-0.455513,-0.240812,-0.0638297,-0.336557,-0.281431,0.0638297}, --NodeBox4
			{-0.32205,-0.240812,-0.0638297,-0.441006,-0.197292,0.0638297}, --NodeBox5
			{-0.426499,-0.197292,-0.0638297,-0.307544,-0.156673,0.0638297}, --NodeBox6
			{-0.414894,-0.156673,-0.0638297,-0.295938,-0.113153,0.0638297}, --NodeBox7
			{-0.5,-0.446808,-0.0638297,-0.38588,-0.409091,0.0638297}, --NodeBox8
			{-0.5,-0.484526,-0.0638297,-0.397485,-0.446808,0.0638297}, --NodeBox9
			{-0.403288,-0.113153,-0.0638297,-0.284333,-0.0696325,0.0638297}, --NodeBox10
			{-0.388782,-0.0696325,-0.0638297,-0.269826,-0.0290134,0.0638297}, --NodeBox11
			{-0.5,-0.0290134,-0.0638297,-0.0667311,0.5,-0.0638297}, --NodeBox12
			{-0.5,-0.0290134,0.0609284,-0.0667311,0.5,0.0609284}, --NodeBox13
			{-0.388782,-0.0290134,-0.199956,-0.388782,0.5,0.20914}, --NodeBox14
			{-0.269826,-0.0290134,-0.197292,-0.269826,0.5,0.205996}, --NodeBox15
		}
	}
})

minetest.register_node(":default:torch",{
	tiles = {
	"3d_torch_torch_top.png",
	"3d_torch_torch_top.png",
	"3d_torch_torch_2.png",
	"3d_torch_torch.png",
		{ name="3d_tprch_torch_on_floor_animated.png",
		animation={
			type="vertical_frames",
			aspect_w=40,
			aspect_h=40,
			length=1.0
			}
		}
	},
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	light_source = 30,
	is_ground_content = true,
	walkable = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {oddly_breakable_by_hand = 1}, 
	drop = 'default:torch',
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0566601,-0.409091,0.402584,0.0447316,-0.362669,0.486083}, --nodebox1
			{-0.0566601,-0.362669,0.384692,0.0447316,-0.319149,0.471173}, --nodebox2
			{0.0447316,-0.277336,0.372763,-0.0566601,-0.319085,0.456262}, --nodebox3
			{-0.0566601,-0.235586,0.357853,0.0447316,-0.277336,0.441352}, --nodebox4
			{0.0447316,-0.235586,0.342942,-0.0566601,-0.193837,0.429423}, --nodebox5
			{-0.0566601,-0.193837,0.328032,0.0447316,-0.152087,0.414513}, --nodebox6
			{-0.0566601,-0.152087,0.310139,0.0447316,-0.110338,0.399602}, --nodebox7
			{-0.0566601,-0.450298,0.414513,0.0447316,-0.409091,0.5}, --nodebox8
			{-0.0566601,-0.492048,0.429423,0.0506959,-0.450298,0.5}, --nodebox9
			{-0.0566601,-0.110338,0.292247,0.0447316,-0.0696325,0.384692}, --nodebox10
			{-0.0566601,-0.0696325,0.280318,0.0447316,0.0477137,0.366799}, --nodebox11
			{-0.0566601,-0.0685885,0.119284,-0.0566601,0.5,0.5}, --NodeBox12
			{0.0447316,-0.0685885,0.119284,0.0447316,0.5,0.5}, --NodeBox13
			{-0.256461,-0.0685885,0.366799,0.247515,0.5,0.366799}, --NodeBox14
			{-0.259443,-0.0685885,0.280318,0.250497,0.5,0.280318}, --NodeBox15
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
		{-0.178926,-0.492048,0.220676,0.172962,0.342942,0.5}, --NodeBox16
		},
	},
})

minetest.register_node("3d_torch:torch_floor",{
	tiles = {
	"3d_torch_torch_top.png",
	"3d_torch_torch_top.png",
	{ name="3d_tprch_torch_on_floor_animated.png",
		animation={
			type="vertical_frames",
			aspect_w=40,
			aspect_h=40,
			length=1.0
			}
		}
	},
	
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	light_source = 30,
	is_ground_content = true,
	walkable = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {oddly_breakable_by_hand = 1}, 
	drop = 'default:torch',
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0696325,-0.5,-0.0638297,0.0638297,0.124758,0.0696325}, --NodeBox1
			{-0.336557,-0.0667312,0.0698737,0.301741,0.5,0.0698737}, --NodeBox2
			{-0.336557,-0.0725339,-0.0693932,0.307544,0.5,-0.0693932}, --NodeBox3
			{0.0522243,-0.0841393,-0.31311,0.0522243,0.5,0.307788}, --NodeBox4
			{-0.0696325,-0.0783366,-0.318913,-0.0696325,0.5,0.296182}, --NodeBox5
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
		{-0.0696325,-0.5,-0.0638297,0.0638297,0.5,0.0696325}, --NodeBox1
		},
	},
})

minetest.register_node("3d_torch:torch_ceiling",{
	tiles = {
	"3d_torch_torch_top.png",
	"3d_torch_torch_top.png",
	{ name="3d_tprch_torch_on_floor_animated.png",
				animation={
					type="vertical_frames",
					aspect_w=40,
					aspect_h=40,
					length=1.0
					}
				}
			},
	
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	light_source = 30,
	is_ground_content = true,
	walkable = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {oddly_breakable_by_hand = 1}, 
	drop = 'default:torch',
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0696325,-0.5,-0.0638297,0.0638297,0.124758,0.0696325}, --NodeBox1
			{-0.336557,-0.0667312,0.0698737,0.301741,0.5,0.0698737}, --NodeBox2
			{-0.336557,-0.0725339,-0.0693932,0.307544,0.5,-0.0693932}, --NodeBox3
			{0.0522243,-0.0841393,-0.31311,0.0522243,0.5,0.307788}, --NodeBox4
			{-0.0696325,-0.0783366,-0.318913,-0.0696325,0.5,0.296182}, --NodeBox5
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
		{-0.0696325,-0.5,-0.0638297,0.0638297,0.5,0.0696325}, --NodeBox1
		},
	},
})