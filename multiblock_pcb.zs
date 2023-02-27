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

val pcb_factory = Builder.start("pcb_factory", 3204)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "CCCCCCCCC",
                "F-------F",
                "F-------F",
                "F-------F",
                "CCCCCCCCC"
            )
            .aisle(
                "CCCCCCCCC",
                "--PLLLP--",
                "--PLLLP--",
                "--PLLLP--",
                "CCCCCCCCC"
            )
            .aisle(
                "CCCCCCCCC",
                "--PLLLP--",
                "--PL-LP--",
                "--PLLLP--",
                "CCCCCCCCC"
            )
            .aisle(
                "CCCCCCCCC",
                "--PLLLP--",
                "--PLLLP--",
                "--PLLLP--",
                "CCCCCCCCC"
            )
            .aisle(
                "CCCCSCCCC",
                "F-------F",
                "F-------F",
                "F-------F",
                "CCCCCCCCC"
            )
            .where('S', controller.self())
            .where('F', <metastate:gregtech:meta_block_frame_8>) // Tritanium Frame Box
            .where('P', <metastate:gregtech:boiler_casing:1>) // Steel Pipe Casing
            .where('L', <metastate:gregtech:transparent_casing:2>) // Laminated Glass
            .where('-', CTPredicate.getAny())
            .where('C', CTPredicate.states(<metastate:gregtech:multiblock_casing:3>)  // Assembly Control Casing
            | CTPredicate.abilities(<mte_ability:MAINTENANCE_HATCH>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setMaxGlobalLimited(4).setPreviewCount(3)
            | controller.autoAbilities(true, false, true, true, false, false, false))
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("pcb_factory")
            .minInputs(2)
            .maxInputs(6)
            .minOutputs(1)
            .maxOutputs(1)
            .minFluidInputs(1)
            .maxFluidInputs(2)
            .build())
    .withBaseTexture(<metastate:gregtech:multiblock_casing:3>)
    .buildAndRegister();

pcb_factory.hasMufflerMechanics = false;
pcb_factory.hasMaintenanceMechanics = true;

makeShaped("pcb_factory_controller", <metaitem:multiblocktweaker:pcb_factory>,
    ["MHM",
     "RCR",
     "MEM"],
    { M : <ore:circuitUv>,
      R : <metaitem:robot.arm.uv>,
      C : <gregtech:multiblock_casing:3>,
      E : <gregtech:machine:1019>,
      H : <gregtech:machine:1023>
      });

pcb_factory.recipeMap.recipeBuilder()
    .duration(200)
    .EUt(32768)
    .inputs(<gregtech:meta_plate:1006> * 32, <gregtech:meta_foil:252> * 64, <gregtech:meta_foil:252> * 64, <gregtech:meta_foil:252> * 64, <gregtech:meta_foil:252> * 64)
    .fluidInputs(<liquid:sulfuric_acid> * 4000)
    .outputs(<gregtech:meta_item_1:385> * 32)
    .buildAndRegister();

pcb_factory.recipeMap.recipeBuilder()
    .duration(200)
    .EUt(32768)
    .inputs(<gregtech:meta_plate:1010> * 2, <gregtech:meta_foil:25> * 64, <gregtech:meta_foil:25> * 40)
    .fluidInputs(<liquid:sulfuric_acid> * 500, <liquid:iron_iii_chloride> * 4000)
    .outputs(<gregtech:meta_item_1:403> * 16)
    .buildAndRegister();

pcb_factory.recipeMap.recipeBuilder()
    .duration(200)
    .EUt(32768)
    .inputs(<gregtech:meta_plate:1013> * 16, <gregtech:meta_foil:41> * 64, <gregtech:meta_foil:41> * 64, <gregtech:meta_foil:277> * 64, <gregtech:meta_foil:277> * 64)
    .fluidInputs(<liquid:sulfuric_acid> * 8000, <liquid:iron_iii_chloride> * 8000)
    .outputs(<gregtech:meta_item_1:404> * 16)
    .buildAndRegister();

pcb_factory.recipeMap.recipeBuilder()
    .duration(200)
    .EUt(32768)
    .inputs(<gregtech:meta_plate:1006> * 16, <gregtech:meta_foil:252> * 64, <gregtech:meta_foil:252> * 64, <gregtech:meta_foil:252> * 64, <gregtech:meta_foil:252> * 64, <gregtech:meta_foil:252> * 64)
    .fluidInputs(<liquid:sulfuric_acid> * 2000, <liquid:iron_iii_chloride> * 16000)
    .outputs(<gregtech:meta_item_1:405> * 16)
    .buildAndRegister();

pcb_factory.recipeMap.recipeBuilder()
    .duration(200)
    .EUt(32768)
    .inputs(<gregtech:meta_item_1:385> * 32, <gregtech:meta_foil:80> * 64, <gregtech:meta_foil:80> * 64, <gregtech:meta_foil:80> * 64, <gregtech:meta_foil:80> * 64)
    .fluidInputs(<liquid:sulfuric_acid> * 8000, <liquid:iron_iii_chloride> * 32000)
    .outputs(<gregtech:meta_item_1:406> * 16)
    .buildAndRegister();

pcb_factory.recipeMap.recipeBuilder()
    .duration(400)
    .EUt(65536)
    .inputs(<gregtech:meta_item_1:387> * 8, <gregtech:meta_foil:296> * 64, <gregtech:meta_foil:296> * 64, <gregtech:meta_foil:296> * 64, <gregtech:meta_foil:296> * 64)
    .fluidInputs(<liquid:iron_iii_chloride> * 40000)
    .outputs(<gregtech:meta_item_1:407> * 8)
    .buildAndRegister();
