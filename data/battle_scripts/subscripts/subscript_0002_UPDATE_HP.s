.include "asm/include/battle_commands.inc"

.data

_000:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_NO_BLINK, _016
    PlayMoveHitSound BATTLER_CATEGORY_MSG_TEMP
    FlickerMon BATTLER_CATEGORY_MSG_TEMP
    Wait 
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_WAITING_BATTLERS, 0, _016
    Call BATTLE_SUBSCRIPT_TYPE_RESIST_BERRY

_016:
    UpdateVar OPCODE_FLAG_OFF, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_NO_BLINK
    UpdateHealthBar BATTLER_CATEGORY_MSG_TEMP
    Wait 
    UpdateHealthBarValue BATTLER_CATEGORY_MSG_TEMP
    TryFaintMon BATTLER_CATEGORY_MSG_TEMP
    CompareVarToValue OPCODE_GT, BSCRIPT_VAR_HP_CALC, 0, _036
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_MSG_BATTLER_TEMP_ASSURANCE_DAMAGE_MASK, BSCRIPT_VAR_HP_CALC

_036:
    End 