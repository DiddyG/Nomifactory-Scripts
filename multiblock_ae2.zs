#packmode normal
#modloaded appliedenergistics2

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

val name as string = "inscriber_factory";

val inscriber_factory = Builder.start("inscriber_factory", 3203)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("CCC", "CCC", "CCC")
            .aisle("CCC", "G-G", "CCC")
            .aisle("CSC", "CGC", "CCC")
            .where('S', controller.self())
            .where('G', <blockstate:gregtech:transparent_casing>)
            .where('-', CTPredicate.getAny())
            .where('C', CTPredicate.states(<metastate:gcym:large_multiblock_casing:2>)
            | controller.autoAbilities(true, false, true, true, false, false, false))
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("inscriber_factory")
            .minInputs(1)
            .maxInputs(3)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:2>)
    .buildAndRegister();
inscriber_factory.hasMaintenanceMechanics = false;
inscriber_factory.hasMufflerMechanics = false;

//Recipe for Controller
makeShaped("inscriber_factory_controller", <metaitem:multiblocktweaker:inscriber_factory>,
    ["MEM",
     "RCR",
     "MEM"],
    { M : <ore:circuitIv>,
      R : <metaitem:robot.arm.iv>,
      C : <gcym:large_multiblock_casing:2>,
      E : <ae2stuff:inscriber>,
      });

inscriber_factory.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(1500)
    .inputs(<metaitem:plateSilicon>)
    .notConsumable(<appliedenergistics2:material:19>)
    .outputs(<appliedenergistics2:material:20>)
    .buildAndRegister();

inscriber_factory.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(1500)
    .inputs(<metaitem:plateDiamond>)
    .notConsumable(<appliedenergistics2:material:14>)
    .outputs(<appliedenergistics2:material:17>)
    .buildAndRegister();

inscriber_factory.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(1500)
    .inputs(<metaitem:plateCertusQuartz>)
    .notConsumable(<appliedenergistics2:material:13>)
    .outputs(<appliedenergistics2:material:16>)
    .buildAndRegister();

inscriber_factory.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(1500)
    .inputs(<metaitem:plateGold>)
    .notConsumable(<appliedenergistics2:material:15>)
    .outputs(<appliedenergistics2:material:18>)
    .buildAndRegister();

inscriber_factory.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(2500)
    .inputs(<appliedenergistics2:material:20>, <appliedenergistics2:material:18>, <ore:circuitLv>)
    .outputs(<appliedenergistics2:material:22>)
    .buildAndRegister();

inscriber_factory.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(2500)
    .inputs(<appliedenergistics2:material:20>, <appliedenergistics2:material:16>, <ore:circuitLv>)
    .outputs(<appliedenergistics2:material:23>)
    .buildAndRegister();

inscriber_factory.recipeMap.recipeBuilder()
    .duration(100)
    .EUt(2500)
    .inputs(<appliedenergistics2:material:20>, <appliedenergistics2:material:17>, <ore:circuitLv>)
    .outputs(<appliedenergistics2:material:24>)
    .buildAndRegister();

