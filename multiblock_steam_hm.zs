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

val advanced_steam_heater = Builder.start("advanced_steam_heater", 3210)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("CCC", "CCC", "CCC")
            .aisle("CCC", "C-C", "CCC")
            .aisle("CSC", "CCC", "CCC")
            .where('S', controller.self())
            .where('-', CTPredicate.getAny())
            .where('C', CTPredicate.states(<metastate:gregtech:metal_casing>)
            | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setMaxGlobalLimited(2).setPreviewCount(2)
            | CTPredicate.abilities(<mte_ability:EXPORT_FLUIDS>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1)
            | controller.autoAbilities(false, false, true, true, false, false, false))
            .build();
        } as IPatternBuilderFunction)
        .withRecipeMap(
            FactoryRecipeMap.start("advanced_steam_heater")
                .minInputs(1)
                .maxInputs(1)
                .minFluidInputs(2)
                .maxFluidInputs(2)
                .minFluidOutputs(1)
                .maxFluidOutputs(1)
                .build())
        .withBaseTexture(<metastate:gregtech:metal_casing>)
        .buildAndRegister();
advanced_steam_heater.hasMaintenanceMechanics=false;
advanced_steam_heater.hasMufflerMechanics=false;

makeShaped("advanced_steam_heater_controller", <metaitem:multiblocktweaker:advanced_steam_heater>,
    ["MEM",
     "RCR",
     "MEM"],
    { M : <gregtech:machine:1>,
      R : <snad:snad>,
      C : <minecraft:furnace>,
      E : <minecraft:bucket>,
    });

advanced_steam_heater.recipeMap.recipeBuilder()
    .duration(50)
    .EUt(-1)
    .inputs(<minecraft:reeds> * 8)
    .fluidInputs(<liquid:creosote> * 250, <liquid:water> * 250)
    .fluidOutputs(<liquid:steam> * 2000)
    .buildAndRegister();