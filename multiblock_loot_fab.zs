#packmode normal
#modloaded deepmoblearning

import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;

import crafttweaker.data.IData;
import crafttweaker.world.IFacing;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IItemCondition;

import scripts.common.makeShaped as makeShaped;

val dml_loot_fab_chamber = Builder.start("dml_loot_fab_chamber", 3101)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "CCCCC", 
                "DEEED", 
                "DEEED", 
                "DEEED", 
                "CCCCC"
            )
            .aisle(
                "CCCCC", 
                "GOOOG", 
                "DOOOD", 
                "GOOOG", 
                "CGGGC"
            )
            .aisle(
                "CCCCC", 
                "GOOOG", 
                "DO-OD", 
                "GOOOG", 
                "CGGGC"
            )
            .aisle(
                "CCCCC", 
                "GOOOG", 
                "DOOOD", 
                "GOOOG", 
                "CGGGC"
            )
            .aisle(
                "CCSCC", 
                "DEGED", 
                "DGGGD", 
                "DEGED", 
                "CCCCC"
            )
            .where('S', controller.self())
            .where('D', <metastate:gcym:large_multiblock_casing:5>)
            .where('E', <metastate:gregtech:meta_block_compressed_2001:2>) // enderium
            .where('G', <metastate:appliedenergistics2:quartz_vibrant_glass:0>)
            .where('O', <metastate:extendedcrafting:storage:4> /* omnium */)
            .where('-', CTPredicate.getAny())
            .where('C', CTPredicate.states(<metastate:gcym:large_multiblock_casing:11>)
            | controller.autoAbilities(true, false, true, true, false, false, false))
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("dml_loot_fab_chamber")
            .minInputs(1)
            .maxInputs(2)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:11>)
    .buildAndRegister();
dml_loot_fab_chamber.hasMaintenanceMechanics = false;
dml_loot_fab_chamber.hasMufflerMechanics = false;

//Recipe for Controller
makeShaped("loot_controller", <metaitem:multiblocktweaker:dml_loot_fab_chamber>,
    ["MHM",
     "RCR",
     "MEM"],
    { M : <metaitem:circuit.wetware_mainframe>,
      R : <metaitem:robot.arm.uv>,
      C : <gcym:large_multiblock_casing:11>,
      E : <gregtech:fusion_casing:1>,
      H : <contenttweaker:heartofauniverse>
      });
	  
dml_loot_fab_chamber.recipeMap.recipeBuilder()
        .duration(10)
        .EUt(3000)
        .inputs(<deepmoblearning:pristine_matter_enderman>)
        .circuit(1)
        .outputs(<contenttweaker:impossiblerealmdata> * 1)
        .buildAndRegister();

dml_loot_fab_chamber.recipeMap.recipeBuilder()
        .duration(15)
        .EUt(8000)
        .inputs(<deepmoblearning:pristine_matter_wither>)
        .circuit(1)
        .outputs(<contenttweaker:witherrealmdata> * 1)
        .buildAndRegister();

dml_loot_fab_chamber.recipeMap.recipeBuilder()
        .duration(20)
        .EUt(12000)
        .circuit(1)
        .inputs(<deepmoblearning:pristine_matter_dragon>)
        .outputs(<contenttweaker:dragonlairdata> * 1)
        .buildAndRegister();


