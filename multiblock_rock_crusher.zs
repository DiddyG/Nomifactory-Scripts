#packmode normal

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

val large_rock_crusher = Builder.start("large_rock_crusher", 3205)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "---C---",
                "---C---",
                "-------",
                "-------"
            )
            .aisle(
                "--CCC--",
                "--CCC--",
                "---C---",
                "-------"
            )
            .aisle(
                "-CCCCC-",
                "-CCCCC-",
                "--CCC--",
                "---C---"
            )
            .aisle(
                "CCCCCCC",
                "CPWRLPC",
                "-CCCCC-",
                "--CCC--"
            )
            .aisle(
                "-CCCCC-",
                "-C---C-",
                "--C-C--",
                "---C---"
            )
            .aisle(
                "--CSC--",
                "--CTC--",
                "---C---",
                "-------"
            )
            .where('S', controller.self())
            .where('T', <metastate:gregtech:transparent_casing>) // Tempered Glass
            .where('P', <metastate:gregtech:turbine_casing:1>) // Steel Gearbox Casing
            .where('L', <metastate:chisel:lavastone>)
            .where('W', <metastate:chisel:waterstone>)
            .where('R', <metastate:minecraft:cobblestone>)
            .where('-', CTPredicate.getAny())
            .where('C', CTPredicate.states(<metastate:gcym:large_multiblock_casing:3>)
            | CTPredicate.abilities(<mte_ability:MAINTENANCE_HATCH>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1)
            | controller.autoAbilities(true, false, true, true, false, false, false))
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("large_rock_crusher")
            .minInputs(1)
            .maxInputs(1)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:3>)
    .buildAndRegister();

large_rock_crusher.hasMaintenanceMechanics = true;
large_rock_crusher.hasMufflerMechanics = false;

makeShaped("rock_crusher_controller", <metaitem:multiblocktweaker:large_rock_crusher>,
    ["MHM",
     "RCR",
     "MEM"],
    { M : <gregtech:meta_item_1:641>,
      R : <gregtech:meta_item_1:177>,
      E : <gcym:large_multiblock_casing:3>,
      C : <gregtech:machine:670>,
      H : <gregtech:meta_item_1:267>
      });

large_rock_crusher.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(32768)
    .notConsumable(<minecraft:stone>)
    .outputs(<minecraft:stone> * 128)
    .buildAndRegister();

large_rock_crusher.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(32768)
    .notConsumable(<minecraft:cobblestone>)
    .outputs(<minecraft:cobblestone> * 128)
    .buildAndRegister();

large_rock_crusher.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(32768)
    .notConsumable(<minecraft:stone:1>)
    .outputs(<minecraft:stone:1> * 128)
    .buildAndRegister();

large_rock_crusher.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(32768)
    .notConsumable(<minecraft:stone:3>)
    .outputs(<minecraft:stone:3> * 128)
    .buildAndRegister();

large_rock_crusher.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(32768)
    .notConsumable(<minecraft:stone:5>)
    .outputs(<minecraft:stone:5> * 128)
    .buildAndRegister();

large_rock_crusher.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(32768)
    .notConsumable(<minecraft:sandstone>)
    .outputs(<minecraft:sandstone> * 128)
    .buildAndRegister();

large_rock_crusher.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(32768)
    .notConsumable(<minecraft:hardened_clay>)
    .outputs(<minecraft:hardened_clay> * 128)
    .buildAndRegister();

large_rock_crusher.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(32768)
    .notConsumable(<minecraft:redstone>)
    .outputs(<minecraft:obsidian> * 128)
    .buildAndRegister();

large_rock_crusher.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(32768)
    .notConsumable(<gregtech:stone_smooth:3>)
    .outputs(<gregtech:stone_smooth:3> * 128)
    .buildAndRegister();

large_rock_crusher.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(32768)
    .notConsumable(<gregtech:stone_smooth:2>)
    .outputs(<gregtech:stone_smooth:2> * 128)
    .buildAndRegister();

large_rock_crusher.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(32768)
    .notConsumable(<gregtech:stone_smooth:0>)
    .outputs(<gregtech:stone_smooth:0> * 128)
    .buildAndRegister();

large_rock_crusher.recipeMap.recipeBuilder()
    .duration(60)
    .EUt(32768)
    .notConsumable(<gregtech:stone_smooth:1>)
    .outputs(<gregtech:stone_smooth:1> * 128)
    .buildAndRegister();