extends Node

const SPELLS = {
 CTRL = "ctrl", 
 PAPER_SHREDDER = "paper_shredder", 
 SOBRIETY_TEST = "sobriety_test", 
 LETTER_STAMP = "letter_stamp", 
 RAZOR_BLADE = "razor_blade", 
 WARFARIN = "warfarin", 
 TYPO = "typo", 
 TYPE_O = "type_o", 
 BACKSPACE = "backspace", 
 BOARD_SHEAR = "board_shear", 
 SHIFT_CIPHER = "shift_cipher", 
 COTTON_CANDY_TAMPON = "cotton_candy_tampon", 
 SNOW = "snow", 
 VERIFICATION_CAN = "verification_can", 
 CAPS_LOCK = "caps_lock", 
 STAPLER = "stapler", 
 GIRL_PILLS = "girl_pills", 
 VICTORY_WHISKEY = "victory_whiskey", 
 SORGHUM_PINK = "sorghum_pink", 
 FIRST_AID = "first_aid", 
 LIP_BALM = "lip_balm", 
 DNA_TWEEZERS = "dna_tweezers", 
 VAMPIRE_TEETH = "vampire_teeth", 
 ICE_IX = "ice_ix", 
 EYE_DROPS = "eye_drops", 
 CATS_CRADLE = "cats_cradle", 
 PARTY_ROSE = "party_rose", 
 NIGHTSTICK = "nightstick", 
 EIGHT_BALL = "eight_ball", 
 SHIFT = "shift", 
 GRAY_GOO = "gray_goo", 
 GIRL_CHUNKS = "girl_chunks", 
 PHOTOCOPIER = "photocopier", 
 BROKEN_HEART = "broken_heart", 
 CIGARETTE = "cigarette", 
 CIGARETTE_BUTT = "cigarette_butt", 
 PERFECT_METAL_CARAPACE = "perfect_metal_carapace", 
 TWELVE_GAUGE_CLAY = "twelve_gauge_clay", 
 C4 = "c4", 
 COFFEE_RATION = "coffee_ration", 
 TUMOR = "tumor", 
 PENTAMETER = "pentameter", 
 SIX_SHOOTER = "six_shooter", 
 LUCKY_CAT = "lucky_cat", 
 SEALED_PACKET = "sealed_packet", 
 PLIERS = "pliers", 
 MODERN_HEART = "modern_heart", 
 CANDY_CIGARETTE = "candy_cigarette", 
 TWO_POINT_LEADING = "two_point_leading", 
 SKINNER_BOX = "skinner_box", 
 PARTY_RATION = "party_ration", 
 BUG_SPRAY = "bug_spray", 
 FAKE_ID = "fake_id", 
 FUEL_RATION = "fuel_ration", 
 ROTARY_DIAL = "rotary_dial", 
 POLITICAL_COMPASS = "political_compass", 
 MBA = "mba", 
 RETZ = "retz", 
 CODE_SWITCH = "code_switch", 
 INGSOCK = "ingsock", 
 GUROLAGA = "gurolaga", 
 JO_PERMIT = "jo_permit", 
 LIDOCAINE = "lidocaine", 
 SLASHFIC = "slashfic", 
 SOCKPUPPET = "sockpuppet", 
 TAFFY_HOOK = "taffy_hook", 
 DRAFT_CARD = "draft_card", 
 WAX_STAMP = "wax_stamp", 
 WAX_LETTER_STAMP = "wax_letter_stamp", 
 HUNDRED_COW_LEAD = "hundred_cow_lead", 
 REPLACEMENT_CHARACTER = "replacement_character", 
 SSN = "ssn", 
 CLOVER = "clover", 
 FINGERPRINTS = "fingerprints", 
 RED_TAPE = "red_tape", 
 FINGERNAIL = "fingernail", 


 LETTER_OPENER = "letter_opener", 
 GIFT_ENHANCING = "gift_enhancing", 
 GIFT_PUZZLE = "gift_puzzle", 
 GIFT_DEFENSE = "gift_defense", 
 FISHING_ROD = "fishing_rod", 
 SALT = "salt", 
 HOLE_PUNCH = "hole_punch", 
 NUDGE_UP = "nudge_up", 
 NUDGE_RIGHT = "nudge_right", 


 RED_LETTER = "red_letter", 
 FLOPPY_DISK = "floppy_disk", 
 CLOWN_CACHE = "clown_cache", 
 PRAXICE = "praxice", 
 DAMAGED_GOODS = "damaged_goods", 
 T_GEL = "t_gel", 
 CORKLINE = "corkline", 
 FISHING_RIFLE = "fishing_rifle", 
 DIME = "dime", 
 PANIC_BUTTON = "panic_button", 


 SILVER_LETTER_OPENER = "silver_letter_opener", 
 MIRACLE_CACHE_ENHANCING = "miracle_cache_enhancing", 
 MIRACLE_CACHE_PUZZLE = "miracle_cache_puzzle", 
 MIRACLE_CACHE_DEFENSE = "miracle_cache_defense", 
 SCALPEL = "scalpel", 
 REINFORCED_FISHING_ROD = "reinforced_fishing_rod", 
 SALT_AND_PEPPER = "salt_and_pepper", 
}

const SPECIAL_COPY_SPELLS = {
 SPELLS.WAX_LETTER_STAMP: SPELLS.WAX_STAMP, 
}



const HIDDEN_SPELLS = [
 SPELLS.REPLACEMENT_CHARACTER, 
 SPELLS.FINGERNAIL, 
 SPELLS.TYPE_O, 


 SPELLS.SILVER_LETTER_OPENER, 
 SPELLS.MIRACLE_CACHE_ENHANCING, 
 SPELLS.MIRACLE_CACHE_DEFENSE, 
 SPELLS.MIRACLE_CACHE_PUZZLE, 
 SPELLS.SCALPEL, 
 SPELLS.REINFORCED_FISHING_ROD, 
 SPELLS.SALT_AND_PEPPER, 
]


const MERGED_SPELL_STATS = {
 SPELLS.WAX_STAMP: SPELLS.WAX_LETTER_STAMP, 
}


const UNTRACKED_SPELLS = [
 SPELLS.NUDGE_RIGHT, 
 SPELLS.NUDGE_UP, 
 SPELLS.WAX_LETTER_STAMP, 
 SPELLS.COFFEE_RATION, 
 SPELLS.WARFARIN, 
]

const CUSTOM_SCRIPT_SPELLS = {
 SPELLS.GIFT_DEFENSE: "gift", 
 SPELLS.GIFT_ENHANCING: "gift", 
 SPELLS.GIFT_PUZZLE: "gift", 
 SPELLS.MIRACLE_CACHE_DEFENSE: "gift", 
 SPELLS.MIRACLE_CACHE_ENHANCING: "gift", 
 SPELLS.MIRACLE_CACHE_PUZZLE: "gift", 
}

enum DamageType{
 DIRECT, 
 PIERCING, 
}

enum TileType{
 DAMAGE, 
 DEFENSE, 
}

const TileStatus = {
 DEFAULT = "default", 
 CRIT = "crit", 
 SPICY = "spicy", 
 COAL = "coal", 
 ACID = "acid", 
 BRUISE = "bruise", 
 ASH = "ash", 
 BLEED = "bleed", 
 PERIOD = "period", 
 CAPITAL = "capital", 
 FROZEN = "frozen", 
 LINKED = "linked", 
 POISON = "poison", 
 GAY = "gay", 
 CANDY = "candy", 
 BOMB = "bomb", 
 ENHANCED = "enhanced", 
 CURSED = "cursed", 
 POOP = "poop", 
 MONEY = "money", 
 MYSTERY = "mystery", 
 HAZE = "haze", 
 ETERNAL = "eternal", 
}

const TileStatusFrame = {
 TileStatus.DEFAULT: 0, 
 TileStatus.CRIT: 1, 
 TileStatus.SPICY: 3, 
 TileStatus.COAL: 5, 
 TileStatus.ACID: 7, 
 TileStatus.BRUISE: 8, 
 TileStatus.ASH: 9, 
 TileStatus.BLEED: 10, 
 TileStatus.FROZEN: 12, 
 TileStatus.POISON: 14, 
 TileStatus.GAY: 15, 
 TileStatus.CANDY: 16, 
 TileStatus.BOMB: 17, 
 TileStatus.ENHANCED: 20, 
 TileStatus.CURSED: 2, 
 TileStatus.POOP: 22, 
 TileStatus.MONEY: 23, 
 TileStatus.HAZE: 24, 
 TileStatus.ETERNAL: 26, 
}

const SHARED_STATUSES = [TileStatus.CAPITAL, TileStatus.PERIOD, TileStatus.MYSTERY, TileStatus.LINKED]
const FACE_STATUSES = [TileStatus.CAPITAL, TileStatus.PERIOD, TileStatus.MYSTERY]

const TileEffect = {
 HOLE = "hole", 
 SHIMMERING = "shimmering", 
 WILDCARD = "wildcard", 
 SLASHED = "slashed", 
 SUIT = "suit", 
 NUMBER = "number", 
 BIGRAM = "bigram", 
 TRIGRAM = "trigram", 
 SUFFIX = "suffix", 
}


const TRACKED_EFFECTS = [
 TileEffect.HOLE, TileEffect.SHIMMERING, TileEffect.WILDCARD, 
 TileEffect.SLASHED, TileEffect.SUIT, TileEffect.NUMBER, 
 TileEffect.BIGRAM, TileEffect.TRIGRAM, 
]


const EFFECTS_WITHOUT_TOOLTIPS = [
 TileStatus.DEFAULT, TileEffect.BIGRAM, TileEffect.TRIGRAM
]

const WILDCARD_EFFECTS = [
 TileEffect.WILDCARD, TileEffect.SLASHED, TileEffect.SUIT, TileEffect.NUMBER
]

const FULL_WILDCARD_EFFECTS = [
 TileEffect.WILDCARD, TileEffect.SUIT, 
]

const PURE_EFFECT_PRIORITY = [
 [TileStatus.DEFAULT, TileStatus.LINKED, TileEffect.BIGRAM, TileEffect.TRIGRAM], 
 TileEffect.NUMBER, 
 TileEffect.WILDCARD, 
 [TileEffect.SLASHED, TileEffect.SUIT], 
]

const DEFAULT_ENEMY_EFFECT_PRIORITY = [
 [
  TileStatus.DEFAULT, TileStatus.CAPITAL, TileStatus.PERIOD, 
  TileStatus.LINKED, TileEffect.BIGRAM, TileEffect.TRIGRAM
 ], 
 TileEffect.NUMBER, 
 TileEffect.WILDCARD, 
 [TileEffect.SLASHED, TileEffect.SUIT], 
]

const AMBIVALENT_ENEMY_EFFECT_PRIORITY = [
 [
  TileStatus.DEFAULT, TileStatus.CAPITAL, TileStatus.PERIOD, 
  TileStatus.LINKED, TileEffect.BIGRAM, TileEffect.TRIGRAM, 
  TileEffect.NUMBER, TileEffect.WILDCARD, TileEffect.SLASHED, 
  TileEffect.SUIT, 
 ]
]



const FACE_SPELL_EFFECT_PRIORITY = [
 [TileStatus.DEFAULT, TileStatus.LINKED, TileEffect.BIGRAM, TileEffect.TRIGRAM], 
 [TileStatus.CAPITAL, TileStatus.PERIOD, TileEffect.SHIMMERING], 
 TileStatus.MONEY, 
 TileStatus.POOP, 
 TileStatus.ASH, 
 TileStatus.GAY, 
 TileStatus.COAL, 
 [
  TileStatus.FROZEN, TileStatus.ENHANCED, TileEffect.WILDCARD, 
  TileEffect.NUMBER, TileEffect.SUIT, TileEffect.SLASHED, 
 ], 
 TileStatus.CANDY, 
]



const STATUS_SPELL_EFFECT_PRIORITY = [
 [
  TileStatus.DEFAULT, TileStatus.LINKED, TileEffect.BIGRAM, 
  TileEffect.TRIGRAM, TileEffect.WILDCARD, TileEffect.NUMBER, 
  TileEffect.SUIT, TileEffect.SLASHED, 
 ], 
 [TileStatus.CAPITAL, TileStatus.PERIOD, TileEffect.SHIMMERING], 
 TileStatus.MONEY, 
 TileStatus.POOP, 
 TileStatus.ASH, 
 TileStatus.GAY, 
 [TileStatus.FROZEN, TileStatus.ENHANCED], 
 TileStatus.CANDY, 
]

const AMBIVALENT_SPELL_EFFECT_PRIORITY = [
 [
  TileStatus.DEFAULT, TileStatus.LINKED, TileEffect.BIGRAM, 
  TileEffect.TRIGRAM, TileStatus.CAPITAL, TileStatus.PERIOD, 
  TileEffect.SHIMMERING, TileEffect.WILDCARD, TileEffect.NUMBER, 
  TileEffect.SUIT, TileEffect.SLASHED, 
 ], 
 TileStatus.MONEY, 
 TileStatus.POOP, 
 TileStatus.ASH, 
 TileStatus.GAY, 
 [
  TileStatus.FROZEN, TileStatus.ENHANCED, TileEffect.WILDCARD, 
  TileEffect.NUMBER, TileEffect.SUIT, TileEffect.SLASHED, 
 ], 
 TileStatus.CANDY, 
]

const NONPOSITIVE_SPELL_EFFECT_PRIORITY = [
 [
  TileStatus.DEFAULT, TileStatus.SPICY, TileStatus.ACID, 
  TileStatus.BRUISE, TileStatus.ASH, TileStatus.BLEED, 
  TileStatus.PERIOD, TileStatus.CAPITAL, TileStatus.LINKED, 
  TileStatus.POISON, TileStatus.GAY, TileStatus.BOMB, 
  TileStatus.CURSED, TileStatus.POOP, TileStatus.MONEY, 
  TileStatus.HAZE, TileStatus.COAL, 
  TileEffect.SHIMMERING, TileEffect.BIGRAM, TileEffect.TRIGRAM, 
 ], 
 [
  TileStatus.FROZEN, TileStatus.ENHANCED, TileEffect.WILDCARD, 
  TileEffect.NUMBER, TileEffect.SUIT, TileEffect.SLASHED, 
 ], 
 TileStatus.CANDY, 
]

const PLURALIZE_EFFECTS = [
 TileStatus.CRIT, 
 TileStatus.BOMB, 
 TileEffect.NUMBER, 
 TileEffect.WILDCARD, 
 TileEffect.BIGRAM, 
 TileEffect.TRIGRAM
]

const LinkColor = {
 GRAY = "gray", 
 SILVER = "silver", 
 RUSTY = "rusty", 
 COBALT = "cobalt", 
 OXIDIZED = "oxidized", 
 GOLD = "gold", 
}

const LinkFrame = {
 LinkColor.GRAY: 0, 
 LinkColor.SILVER: 1, 
 LinkColor.RUSTY: 2, 
 LinkColor.COBALT: 3, 
 LinkColor.OXIDIZED: 4, 
 LinkColor.GOLD: 5, 
}

const WORD_CATEGORIES: Dictionary[String, String] = {
 COLORS = "colors", 
 FRUITS_AND_VEGETABLES = "fruits_and_vegetables", 
 ANIMALS = "animals", 
 METALS = "metals", 
 BODY_PARTS = "body_parts", 
}

const WORD_CATEGORY_FLAGS = {
 WORD_CATEGORIES.COLORS: WordDictionary.WordFlags.COLORS, 
 WORD_CATEGORIES.FRUITS_AND_VEGETABLES: WordDictionary.WordFlags.FRUITS_AND_VEGETABLES, 
 WORD_CATEGORIES.ANIMALS: WordDictionary.WordFlags.ANIMALS, 
 WORD_CATEGORIES.METALS: WordDictionary.WordFlags.METALS, 
 WORD_CATEGORIES.BODY_PARTS: WordDictionary.WordFlags.BODY_PARTS, 
}

enum Intent{

 PLAYER_BRUISE, 


 DAMAGE, 
 DEFENSE, 
 DAMAGE_MULTIPLIER, 
 DEFENSE_MULTIPLIER, 
 ACID, 
 BRUISE, 
 BLEED, 
 SHIMMERING, 
 PERIOD, 
 CAPITAL, 
 LINKED, 
 STRAIGHT, 
 POISON, 
 HEAL, 
 BOMB, 
 CURSED, 
 REPEAT_WORD, 
 LACED, 
 HAZE, 
 ETERNAL, 
 CRIT_CHANCE, 
 CATEGORY_MATCHED, 
 SPIKED_SLOTS, 


 ATTACK, 
 HARMLESS_ATTACK, 
 ABDUCT, 
 SWAP_TYPE, 
 PARRY, 
 DEFEND, 
 BLEED_CURSE, 
 CURSED_CAPITAL, 
 LOCK_RESTOCK, 
 MULTITUDE, 
 TRAFFIC, 
 FEED, 
 HOLE_PUNCH, 
 BLEED_WILDCARD, 
 TICKING, 
 DETONATE, 
 SPRAWL, 
 DOUBLESPEAK, 
 DREAM, 
 FILTER, 
 BLOW, 
 POISON_SCRAMBLE, 
 MYSTERY_CRIT, 
 BLEED_FULL_WORD, 
 KEYPAD, 
 PASSCODE, 
 APPLY_STATUS, 
 CONVERT_STATUS, 
 PADDLE, 
 SUIT_PADDLE, 
 BITE, 
 APPLY_ETERNAL, 
 CATEGORY, 

 EXPAND_BOARD, 
 LETTER_OPENER, 
 BOARD_SHEAR, 
 CLEAR_BOARD, 
 SHRINK_BOARD, 
 CURSE_BOARD, 
 CONCENTRATION, 
 ACID_BOMB, 
 PREPARING, 
}

const SPELL_POOL = {
 SPELLS.CTRL: 1.0, 
 SPELLS.PAPER_SHREDDER: 1.0, 
 SPELLS.SOBRIETY_TEST: 1.0, 
 SPELLS.LETTER_STAMP: 1.0, 
 SPELLS.RAZOR_BLADE: 1.0, 

 SPELLS.TYPO: 1.0, 
 SPELLS.BACKSPACE: 1.0, 
 SPELLS.BOARD_SHEAR: 1.0, 
 SPELLS.SHIFT_CIPHER: 1.0, 
 SPELLS.COTTON_CANDY_TAMPON: 1.0, 
 SPELLS.SNOW: 1.0, 
 SPELLS.VERIFICATION_CAN: 1.0, 
 SPELLS.CAPS_LOCK: 1.0, 
 SPELLS.STAPLER: 1.0, 
 SPELLS.GIRL_PILLS: 1.0, 
 SPELLS.VICTORY_WHISKEY: 1.0, 
 SPELLS.SORGHUM_PINK: 1.0, 
 SPELLS.FIRST_AID: 1.0, 
 SPELLS.LIP_BALM: 1.0, 
 SPELLS.DNA_TWEEZERS: 1.0, 
 SPELLS.VAMPIRE_TEETH: 1.0, 
 SPELLS.EYE_DROPS: 1.0, 
 SPELLS.CATS_CRADLE: 1.0, 
 SPELLS.PARTY_ROSE: 1.0, 
 SPELLS.NIGHTSTICK: 1.0, 
 SPELLS.SHIFT: 1.0, 
 SPELLS.GRAY_GOO: 1.0, 
 SPELLS.GIRL_CHUNKS: 0.5, 
 SPELLS.PHOTOCOPIER: 1.0, 
 SPELLS.CIGARETTE: 1.0, 
 SPELLS.CIGARETTE_BUTT: 1.0, 
 SPELLS.PERFECT_METAL_CARAPACE: 1.0, 
 SPELLS.TWELVE_GAUGE_CLAY: 1.0, 
 SPELLS.SEALED_PACKET: 1.0, 
 SPELLS.PLIERS: 1.0, 
 SPELLS.MODERN_HEART: 1.0, 
 SPELLS.CANDY_CIGARETTE: 1.0, 
 SPELLS.TWO_POINT_LEADING: 1.0, 
 SPELLS.SKINNER_BOX: 1.0, 
 SPELLS.PARTY_RATION: 1.0, 
 SPELLS.BUG_SPRAY: 1.0, 
 SPELLS.FAKE_ID: 1.0, 
 SPELLS.FUEL_RATION: 1.0, 
 SPELLS.POLITICAL_COMPASS: 1.0, 
 SPELLS.ROTARY_DIAL: 1.0, 
 SPELLS.MBA: 1.0, 
 SPELLS.RETZ: 0.75, 
 SPELLS.CODE_SWITCH: 1.0, 
 SPELLS.INGSOCK: 1.0, 
 SPELLS.GUROLAGA: 1.0, 
 SPELLS.JO_PERMIT: 1.0, 
 SPELLS.LIDOCAINE: 1.0, 
 SPELLS.SLASHFIC: 1.0, 
 SPELLS.SOCKPUPPET: 1.0, 
 SPELLS.TAFFY_HOOK: 1.0, 
 SPELLS.DRAFT_CARD: 1.0, 
 SPELLS.WAX_STAMP: 1.0, 
 SPELLS.HUNDRED_COW_LEAD: 1.0, 
 SPELLS.REPLACEMENT_CHARACTER: 0.0, 
 SPELLS.SSN: 1.0, 
 SPELLS.CLOVER: 1.0, 
 SPELLS.FINGERPRINTS: 1.0, 
 SPELLS.RED_TAPE: 1.0, 
 SPELLS.FINGERNAIL: 0.01, 


 SPELLS.RED_LETTER: 0.5, 
 SPELLS.FLOPPY_DISK: 1.0, 
 SPELLS.CLOWN_CACHE: 1.0, 
 SPELLS.PRAXICE: 1.0, 
 SPELLS.DAMAGED_GOODS: 0.5, 
 SPELLS.T_GEL: 1.0, 
 SPELLS.CORKLINE: 1.0, 
 SPELLS.FISHING_RIFLE: 1.0, 
 SPELLS.DIME: 1.0, 
 SPELLS.PANIC_BUTTON: 1.0, 


 SPELLS.TUMOR: 1.0, 
 SPELLS.BROKEN_HEART: 1.0, 
 SPELLS.C4: 1.0, 
 SPELLS.PENTAMETER: 1.0, 
 SPELLS.SIX_SHOOTER: 1.0, 
 SPELLS.LUCKY_CAT: 1.0, 
 SPELLS.EIGHT_BALL: 1.0, 
 SPELLS.ICE_IX: 1.0, 
}

const SPELL_CATEGORY = {
 SUPPORT = "support", 
 DEFENSIVE = "defensive", 
 OFFENSIVE = "offensive", 
}

const GIFT_TO_CATEGORY = {
 SPELLS.GIFT_DEFENSE: SPELL_CATEGORY.DEFENSIVE, 
 SPELLS.MIRACLE_CACHE_DEFENSE: SPELL_CATEGORY.DEFENSIVE, 
 SPELLS.GIFT_ENHANCING: SPELL_CATEGORY.OFFENSIVE, 
 SPELLS.MIRACLE_CACHE_ENHANCING: SPELL_CATEGORY.OFFENSIVE, 
 SPELLS.GIFT_PUZZLE: SPELL_CATEGORY.SUPPORT, 
 SPELLS.MIRACLE_CACHE_PUZZLE: SPELL_CATEGORY.SUPPORT, 
}

const DEFENSIVE_CHILD_SPELLS: Array[String] = [
 SPELLS.SNOW, 
 SPELLS.GIRL_PILLS, 
 SPELLS.VICTORY_WHISKEY, 
 SPELLS.FIRST_AID, 
 SPELLS.ICE_IX, 
 SPELLS.EYE_DROPS, 
 SPELLS.NIGHTSTICK, 
 SPELLS.PERFECT_METAL_CARAPACE, 
 SPELLS.C4, 
 SPELLS.MODERN_HEART, 
 SPELLS.LIDOCAINE, 
 SPELLS.SOCKPUPPET, 
 SPELLS.LIP_BALM, 
 SPELLS.FAKE_ID, 
]

const SPELL_CATEGORIES = {
 SPELL_CATEGORY.SUPPORT: [
  SPELLS.CTRL, 
  SPELLS.PAPER_SHREDDER, 
  SPELLS.SOBRIETY_TEST, 
  SPELLS.LETTER_STAMP, 
  SPELLS.TYPO, 
  SPELLS.BACKSPACE, 
  SPELLS.BOARD_SHEAR, 
  SPELLS.SHIFT_CIPHER, 
  SPELLS.DNA_TWEEZERS, 
  SPELLS.PHOTOCOPIER, 
  SPELLS.CIGARETTE_BUTT, 
  SPELLS.TWELVE_GAUGE_CLAY, 
  SPELLS.TWO_POINT_LEADING, 
  SPELLS.FLOPPY_DISK, 
  SPELLS.FINGERNAIL, 
  SPELLS.BUG_SPRAY, 
  SPELLS.PRAXICE, 
  SPELLS.FAKE_ID, 
  SPELLS.FUEL_RATION, 
  SPELLS.DIME, 
  SPELLS.ROTARY_DIAL, 
  SPELLS.MBA, 
  SPELLS.CODE_SWITCH, 
  SPELLS.INGSOCK, 
  SPELLS.JO_PERMIT, 
  SPELLS.SLASHFIC, 
  SPELLS.FISHING_RIFLE, 
  SPELLS.WAX_STAMP, 
  SPELLS.HUNDRED_COW_LEAD, 
  SPELLS.CLOVER, 
  SPELLS.FINGERPRINTS, 
  SPELLS.RED_TAPE, 
 ], 
 SPELL_CATEGORY.DEFENSIVE: [
  SPELLS.COTTON_CANDY_TAMPON, 
  SPELLS.SNOW, 
  SPELLS.VERIFICATION_CAN, 
  SPELLS.GIRL_PILLS, 
  SPELLS.VICTORY_WHISKEY, 
  SPELLS.SORGHUM_PINK, 
  SPELLS.FIRST_AID, 
  SPELLS.ICE_IX, 
  SPELLS.EYE_DROPS, 
  SPELLS.NIGHTSTICK, 
  SPELLS.BROKEN_HEART, 
  SPELLS.PERFECT_METAL_CARAPACE, 
  SPELLS.C4, 
  SPELLS.MODERN_HEART, 
  SPELLS.CANDY_CIGARETTE, 
  SPELLS.VAMPIRE_TEETH, 
  SPELLS.PARTY_RATION, 
  SPELLS.LIDOCAINE, 
  SPELLS.SOCKPUPPET, 
  SPELLS.TAFFY_HOOK, 
 ], 
 SPELL_CATEGORY.OFFENSIVE: [
  SPELLS.RAZOR_BLADE, 
  SPELLS.CAPS_LOCK, 
  SPELLS.STAPLER, 
  SPELLS.LIP_BALM, 
  SPELLS.CATS_CRADLE, 
  SPELLS.PARTY_ROSE, 
  SPELLS.EIGHT_BALL, 
  SPELLS.SHIFT, 
  SPELLS.PLIERS, 
  SPELLS.SKINNER_BOX, 
  SPELLS.LUCKY_CAT, 
  SPELLS.SIX_SHOOTER, 
  SPELLS.DAMAGED_GOODS, 
  SPELLS.CIGARETTE, 
  SPELLS.TUMOR, 
  SPELLS.PENTAMETER, 
  SPELLS.SEALED_PACKET, 
  SPELLS.CORKLINE, 
  SPELLS.PANIC_BUTTON, 
  SPELLS.GRAY_GOO, 
  SPELLS.POLITICAL_COMPASS, 
  SPELLS.RETZ, 
  SPELLS.GUROLAGA, 
  SPELLS.DRAFT_CARD, 
  SPELLS.GIRL_CHUNKS, 
  SPELLS.SSN, 
 ], 
}

const CLOWN_EXCLUDE = [
 SPELLS.FINGERNAIL
]

const GIFTS = [
 SPELLS.GIFT_ENHANCING, 
 SPELLS.GIFT_DEFENSE, 
 SPELLS.GIFT_PUZZLE, 
]

const MIRACLE_CACHES = [
 SPELLS.MIRACLE_CACHE_ENHANCING, 
 SPELLS.MIRACLE_CACHE_DEFENSE, 
 SPELLS.MIRACLE_CACHE_PUZZLE, 
]

const GIFT_TO_MIRACLE_CACHE = {
 SPELLS.GIFT_ENHANCING: SPELLS.MIRACLE_CACHE_ENHANCING, 
 SPELLS.GIFT_DEFENSE: SPELLS.MIRACLE_CACHE_DEFENSE, 
 SPELLS.GIFT_PUZZLE: SPELLS.MIRACLE_CACHE_PUZZLE, 
}


const GIFT_SPELLS = [
 SPELLS.GIFT_ENHANCING, 
 SPELLS.GIFT_DEFENSE, 
 SPELLS.GIFT_PUZZLE, 
 SPELLS.MIRACLE_CACHE_ENHANCING, 
 SPELLS.MIRACLE_CACHE_DEFENSE, 
 SPELLS.MIRACLE_CACHE_PUZZLE, 
 SPELLS.CLOWN_CACHE, 
]

const RED_LETTER_SPELLS = [
 SPELLS.SILVER_LETTER_OPENER, 
 SPELLS.MIRACLE_CACHE_ENHANCING, 
 SPELLS.MIRACLE_CACHE_DEFENSE, 
 SPELLS.MIRACLE_CACHE_PUZZLE, 
 SPELLS.SCALPEL, 
 SPELLS.REINFORCED_FISHING_ROD, 
 SPELLS.SALT_AND_PEPPER, 
]

const SPELL_CURSES = {
 FRAGILE = "fragile", 
 ESOTERIC = "esoteric", 
 CENSORED = "censored", 
 NOSTALGIC = "nostalgic", 

 LACED = "laced", 

 SHINY = "shiny", 
 CURSED = "cursed", 
}

const CHARGE_CATEGORIES = {
 VERY_RARE = "very_rare", 
 RARE = "rare", 
 UNCOMMON = "uncommon", 
 COMMON = "common", 
 VERY_COMMON = "very_common", 
 SPECIFY = "specify", 
 ANY = "any", 
 RANDOM_SPELL = "random_spell", 
 UNLIMITED = "unlimited", 
 LIMITED = "limited", 
 AUTO = "auto", 
}

const SPECIAL_CHARGES = [
 CHARGE_CATEGORIES.RANDOM_SPELL, 
 CHARGE_CATEGORIES.UNLIMITED, 
 CHARGE_CATEGORIES.LIMITED, 
 CHARGE_CATEGORIES.AUTO, 
]

const CHARGE_STARVE_LIMIT = {
 CHARGE_CATEGORIES.VERY_RARE: 5, 
 CHARGE_CATEGORIES.RARE: 5, 
 CHARGE_CATEGORIES.UNCOMMON: 4, 
 CHARGE_CATEGORIES.COMMON: 3, 
 CHARGE_CATEGORIES.VERY_COMMON: 2, 
}

const CHARGE_CHARACTERS = {
 CHARGE_CATEGORIES.VERY_RARE: ["q", "j", "x", "z", "w", "k", "v"], 
 CHARGE_CATEGORIES.RARE: ["f", "y", "b", "h", "m"], 
 CHARGE_CATEGORIES.UNCOMMON: ["p", "g", "u", "d", "c"], 
 CHARGE_CATEGORIES.COMMON: ["l", "o", "t", "n", "r"], 
 CHARGE_CATEGORIES.VERY_COMMON: ["a", "i", "s", "e"], 
 CHARGE_CATEGORIES.ANY: Letters.ALPHABET, 
}

const DIFFICULTY_COUNT = 11

const VIOLET_CURSES = [
 SPELL_CURSES.ESOTERIC, 
 SPELL_CURSES.CENSORED, 
 SPELL_CURSES.NOSTALGIC, 
]

const ORANGE_CURSES = [
 SPELL_CURSES.FRAGILE, 
 SPELL_CURSES.LACED, 
 SPELL_CURSES.SHINY, 
]

const COLORS = {
 WOOD = Color(3720253951), 
 PLASTIC = Color(2628759551), 
 FIRE = Color(3717351423), 
 POISON = Color(2091076863), 
 ACID = Color(3422102271), 
 COAL = Color(1077952767), 
 BRUISE = Color(2892083199), 
 ASH = Color(3402155519), 
 BLOOD = Color(3677429503), 
 ICE = Color(3504727551), 
 INK_BLACK = Color(639905535), 
 LIGHT_SMOKE = Color(2307031807), 
 SMOKE = Color(1751344127), 
 SMOKE_SHIT = Color(1077820928), 
 DARK_SMOKE = Color(1060978175), 
 BLEND_SMOKE = Color(2307031679), 
 COP_BLOOD = Color(1413657343), 
 PEOPLE_BLOOD = Color(3673448959), 
 XRAFSTAR_BLOOD = Color(3602867455), 
 ALIUM_BLOOD = Color(1773505791), 
 CHLOROPHYLL = Color(2896644607), 
 CHASER_PINK = Color(4242466559), 
 PISS_ICE = Color(4042121727), 
}

const TILE_FACE_COLOR = {
 TileStatus.BOMB: [Color.WHITE, Color.WHITE]
}

const TILE_VALUE_COLOR = {
 TileStatus.POOP: [Color(1665546751), Color(1363160063)], 
 TileStatus.MONEY: [Color(2054445567), Color(1786404351)]
}

const TILE_DEBOSS_COLOR = {
 TileStatus.DEFAULT: [Color(4158432767), Color(3352743423)], 
 TileStatus.ACID: [Color(3959380479), Color(3271544319)], 
 TileStatus.ASH: [Color(3688747775), Color(3638285823)], 
 TileStatus.BLEED: [Color(3897437439), Color(4283393279)], 
 TileStatus.BOMB: [Color(1126599167), Color(1244382463)], 
 TileStatus.BRUISE: [Color(3012285439), Color(2526798847)], 
 TileStatus.CANDY: [Color(4292730367), Color(4293328639)], 
 TileStatus.COAL: [Color(1751673087), Color(1751673087)], 
 TileStatus.CRIT: [Color(4106346495), Color(3871801343)], 
 TileStatus.CURSED: [Color(3731729407), Color(3128275199)], 
 TileStatus.ENHANCED: [Color(3991262207), Color(3184116479)], 
 TileStatus.FROZEN: [Color(3790597119), Color(4160749567)], 
 TileStatus.GAY: [Color(4022515455), Color(3622630911)], 
 TileStatus.MONEY: [Color(3756174079), Color(3639661055)], 
 TileStatus.POISON: [Color(3739582207), Color(3304105471)], 
 TileStatus.POOP: [Color(2860802559), Color(2660193023)], 
 TileStatus.SPICY: [Color(4291636223), Color(4293630463)], 
 TileStatus.HAZE: [Color(3890673663), Color(3958897919)], 
 TileStatus.ETERNAL: [Color(4294967295), Color(4294967295)], 
}

const TILE_POOF_COLOR = {
 TileStatus.DEFAULT: [Color(3720253951), Color(2628759551)], 
 TileStatus.BLEED: [Color(3677429503), Color(3676215807)], 
 TileStatus.ENHANCED: [Color(3856452095), Color(2627968511)], 
 TileStatus.CRIT: [Color(3937128959), Color(2947545087)], 
 TileStatus.CURSED: [Color(3075953407), Color(2204205311)], 
 TileStatus.FROZEN: [Color(3504265983), Color(3504727551)], 
 TileStatus.POOP: [Color(2658621695), Color(2272280575)], 
 TileStatus.SPICY: [Color(4290448127), Color(4039464447)], 
 TileStatus.MONEY: [Color(3436616447), Color(2966204415)], 
 TileStatus.POISON: [Color(3470554367), Color(2329643263)], 
 TileStatus.COAL: [Color(1499027967), Color(1769437951)], 
 TileStatus.GAY: [Color(3869468927), Color(2093925119)], 
 TileStatus.CANDY: [Color(4207792895), Color(3720801023)], 
 TileStatus.ACID: [Color(3422102271), Color(1442091263)], 
 TileStatus.BOMB: [Color(993742847), Color(622289919)], 
 TileStatus.BRUISE: [Color(2993732863), Color(2205335551)], 
 TileStatus.ASH: [Color(3553607423), Color(2677906175)], 
 TileStatus.HAZE: [Color(3435651839), Color(3352354303)], 

 TileStatus.ETERNAL: [Color(3789810431), Color(3537493503)], 
}

const MUSIC = {
 DEATH_OF_THE = {
  LOOP = preload("res://music/deathofthe.ogg"), 
 }, 
 AUTHOR = {
  LOOP = preload("res://music/author.ogg"), 
  VOLUME = 0.4, 
 }, 
 PREFACE = {
  INTRO = preload("res://music/preface_intro.ogg"), 
  LOOP = preload("res://music/preface_loop.ogg"), 
 }, 
 TYPEFACE = {
  LOOP = preload("res://music/typeface.ogg"), 
  VOLUME = 0.4, 
 }, 
 ASTERISK = {
  INTRO = preload("res://music/asterisk_intro.ogg"), 
  LOOP = preload("res://music/asterisk_loop.ogg"), 
  VOLUME = 0.4, 
 }, 
 WAXSTAMP = {
  INTRO = preload("res://music/waxstamp_intro.ogg"), 
  LOOP = preload("res://music/waxstamp_loop.ogg"), 
  VOLUME = 0.5, 
  LOOP_VOLUME = 0.3, 
 }, 
 INTERROBANG = {
  LOOP = preload("res://music/interrobang.ogg"), 
  VOLUME = 0.3, 
 }, 
 LOGOS = {
  INTRO = preload("res://music/logos_intro.ogg"), 
  LOOP = preload("res://music/logos_loop.ogg"), 
  LOOP_INTRO = false, 
  VOLUME = 0.3, 
  LOOP_VOLUME = 1.0, 
 }, 
 LOGOS_LOOP = {
  INTRO = preload("res://music/logos_intro.ogg"), 
  LOOP_INTRO = true, 
  VOLUME = 0.3, 
 }, 
 RETCON = {
  INTRO = preload("res://music/retcon_intro.ogg"), 
  LOOP = preload("res://music/retcon_loop.ogg"), 
  VOLUME = 0.5, 
  LOOP_VOLUME = 0.9, 
 }, 
 ETHOS = {
  INTRO = preload("res://music/ethos_intro.ogg"), 
  LOOP = preload("res://music/ethos_loop.ogg"), 
  VOLUME = 0.4, 
 }, 
 BODY_PARAGRAPH = {
  LOOP = preload("res://music/body_paragraph.ogg"), 
  VOLUME = 0.3
 }, 
 PATHOS = {
  INTRO = preload("res://music/pathos_intro.ogg"), 
  LOOP = preload("res://music/pathos_loop.ogg"), 
  VOLUME = 0.3, 
 }, 
 HEADLINE = {
  INTRO = preload("res://music/headline_intro.ogg"), 
  LOOP = preload("res://music/headline_loop.ogg"), 
  VOLUME = 0.4, 
 }, 
 DROPCAP = {
  INTRO = preload("res://music/dropcap_intro.ogg"), 
  LOOP = preload("res://music/dropcap_loop.ogg"), 
  VOLUME = 0.5, 
 }, 
 MX = {
  INTRO = preload("res://music/mx_intro.ogg"), 
  LOOP = preload("res://music/mx_loop.ogg"), 
  VOLUME = 0.4, 
 }, 


 I_WONDER_IF = {
  INTRO = preload("res://music/shadow/iwonderif_intro.ogg"), 
  LOOP = preload("res://music/shadow/iwonderif_loop.ogg"), 
 }, 
 THEY_FOUND_TOMORROW = {
  INTRO = preload("res://music/shadow/theyfoundtomorrow_intro.ogg"), 
  LOOP = preload("res://music/shadow/theyfoundtomorrow_loop.ogg"), 
  VOLUME = 0.4, 
 }, 
 TO_STAY_DEAD = {
  INTRO = preload("res://music/shadow/tostaydead_intro.ogg"), 
  LOOP = preload("res://music/shadow/tostaydead_loop.ogg"), 
  VOLUME = 0.3, 
 }, 
 IF_YOU_WANT = {
  INTRO = preload("res://music/shadow/ifyouwant_intro.ogg"), 
  LOOP = preload("res://music/shadow/ifyouwant_loop.ogg"), 
  VOLUME = 0.4
 }, 
 IF_YOU_WANT_LOOP = {
  LOOP = preload("res://music/shadow/ifyouwant_loop.ogg"), 
  VOLUME = 0.4, 
 }, 
 FAILURE_TO_THRIVE = {
  INTRO = preload("res://music/shadow/failuretothrive_intro.ogg"), 
  LOOP = preload("res://music/shadow/failuretothrive_loop.ogg"), 
  VOLUME = 0.6, 
  LOOP_VOLUME = 1.0, 
 }, 
 WHAT_WAS_SHE = {
  INTRO = preload("res://music/shadow/whatwasshe_intro.ogg"), 
  LOOP = preload("res://music/shadow/whatwasshe_loop.ogg"), 
  VOLUME = 0.4, 
 }, 
 THERE_HE_GOES = {
  INTRO = preload("res://music/shadow/therehegoes_intro.ogg"), 
  LOOP = preload("res://music/shadow/therehegoes_loop.ogg"), 
  VOLUME = 0.5, 
 }, 
 IT_DID_IT = {
  INTRO = preload("res://music/shadow/itdidit_intro.ogg"), 
  LOOP = preload("res://music/shadow/itdidit_loop.ogg"), 
  VOLUME = 0.5, 
  LOOP_VOLUME = 0.6, 
 }, 
 WE_WERE_THERE = {
  INTRO = preload("res://music/shadow/wewerethere_intro.ogg"), 
  LOOP = preload("res://music/shadow/wewerethere_loop.ogg"), 
  VOLUME = 0.6, 
 }, 
}

const CHARACTERS = {
 LEXICOGRAPHER = "lexicographer", 
 CHILD = "child", 
 JUBILIST = "jubilist", 
 FISHER = "fisher", 
 ADDICT = "addict", 
}

const CHARACTER_ORDER = [
 CHARACTERS.LEXICOGRAPHER, 
 CHARACTERS.JUBILIST, 
 CHARACTERS.CHILD, 
 CHARACTERS.FISHER, 
 CHARACTERS.ADDICT
]

const CHARACTER_ICONS = {
 CHARACTERS.LEXICOGRAPHER: 0, 
 CHARACTERS.JUBILIST: 1, 
 CHARACTERS.CHILD: 2, 
 CHARACTERS.FISHER: 3, 
 CHARACTERS.ADDICT: 4, 
}

const CHARACTER_SPELLS = {
 CHARACTERS.LEXICOGRAPHER: [SPELLS.LETTER_OPENER], 
 CHARACTERS.JUBILIST: [SPELLS.GIFT_ENHANCING], 
 CHARACTERS.FISHER: [SPELLS.FISHING_ROD], 
 CHARACTERS.CHILD: [SPELLS.HOLE_PUNCH], 
 CHARACTERS.ADDICT: [SPELLS.SALT], 
}

const CRIT_CHANCE = {

 CHARACTERS.LEXICOGRAPHER: {
  MIN = 0.02, 
  MAX = 1.0, 
  DIVIDE_BY = 2.0, 
  MINIMUM_WORD_LENGTH = 4, 

  BONUS_PER_LETTER = 0.015, 
  WILDCARD = false, 
 }, 
 CHARACTERS.CHILD: {
  MIN = 0.0, 
  CUTOFF = 0.02, 
  BONUS_PER_LETTER = 0.0, 
 }, 
 CHARACTERS.FISHER: {
  MIN = 0.0, 
  CUTOFF = 0.02, 
  BONUS_PER_LETTER = 0.0, 
 }, 
 CHARACTERS.ADDICT: {
  MIN = 0.05, 
  BONUS_PER_LETTER = 0.03, 
  WILDCARD = true, 
 }, 
}

const ACHIEVEMENTS = {
 OVERALL_MAX_DIFFICULTY = "overall_max_difficulty", 
 LEXICOGRAPHER_MAX_DIFFICULTY = "lexicographer_max_difficulty", 
 CHILD_MAX_DIFFICULTY = "child_max_difficulty", 
 JUBILIST_MAX_DIFFICULTY = "jubilist_max_difficulty", 
 FISHER_MAX_DIFFICULTY = "fisher_max_difficulty", 
 ADDICT_MAX_DIFFICULTY = "addict_max_difficulty", 
 UNLOCK_CHILD = "unlock_child", 
 UNLOCK_JUBILIST = "unlock_jubilist", 
 UNLOCK_FISHER = "unlock_fisher", 
 UNLOCK_ADDICT = "unlock_addict", 
 FIRST_RUN = "first_run", 
 QUALITY_OF_LIFE_ADJUSTMENT = "quality_of_life_adjustment", 
 LINGUISTIC_DRIFT = "linguistic_drift", 
 BEAT_FRIENDS_DAILY = "beat_friends_daily", 
 UNLOCK_ACT_1_CHAMPIONS = "unlock_act_1_champions", 
 UNLOCK_ACT_2_CHAMPIONS = "unlock_act_2_champions", 
 UNLOCK_ACT_3_CHAMPIONS = "unlock_act_3_champions", 
 READ_FULL_PHONEBOOK = "read_full_phonebook", 
 GOOD = "good", 
 PLUSGOOD = "plusgood", 
 DOUBLEPLUSGOOD = "doubleplusgood", 
 PEE_YOUR_PANTS = "pee_your_pants", 

 PRONOUNS = "pronouns", 
 HAZEL_PRONOUNS = "hazel_pronouns", 
}

const SPELL_ACHIEVEMENTS = [

 SPELLS.RED_LETTER, 
 SPELLS.CLOWN_CACHE, 
 SPELLS.T_GEL, 
 SPELLS.CORKLINE, 
 SPELLS.DIME, 


 SPELLS.FLOPPY_DISK, 
 SPELLS.PRAXICE, 
 SPELLS.DAMAGED_GOODS, 
 SPELLS.FISHING_RIFLE, 
 SPELLS.PANIC_BUTTON, 


 SPELLS.GRAY_GOO, 
 SPELLS.DNA_TWEEZERS, 
 SPELLS.PERFECT_METAL_CARAPACE, 
 SPELLS.FUEL_RATION, 
 SPELLS.LIP_BALM, 
 SPELLS.MBA, 
 SPELLS.SEALED_PACKET, 
 SPELLS.JO_PERMIT, 
 SPELLS.TAFFY_HOOK, 
 SPELLS.WAX_STAMP, 


 SPELLS.SOCKPUPPET, 
 SPELLS.MODERN_HEART, 
 SPELLS.SLASHFIC, 
 SPELLS.COTTON_CANDY_TAMPON, 
 SPELLS.VERIFICATION_CAN, 
 SPELLS.CATS_CRADLE, 
 SPELLS.GUROLAGA, 
 SPELLS.ROTARY_DIAL, 
 SPELLS.VAMPIRE_TEETH, 
 SPELLS.RETZ, 
 SPELLS.GIRL_CHUNKS, 
 SPELLS.DRAFT_CARD, 
 SPELLS.SSN, 


 SPELLS.TUMOR, 
 SPELLS.BROKEN_HEART, 
 SPELLS.C4, 
 SPELLS.PENTAMETER, 
 SPELLS.SIX_SHOOTER, 
 SPELLS.LUCKY_CAT, 
 SPELLS.EIGHT_BALL, 
 SPELLS.ICE_IX, 


 SPELLS.POLITICAL_COMPASS, 
 SPELLS.RED_TAPE, 
 SPELLS.TWELVE_GAUGE_CLAY, 
 SPELLS.SOBRIETY_TEST, 
 SPELLS.SKINNER_BOX, 
]

const PROGRESS_ACHIEVEMENTS = [
 ACHIEVEMENTS.UNLOCK_ACT_1_CHAMPIONS, 
 ACHIEVEMENTS.UNLOCK_ACT_2_CHAMPIONS, 
 ACHIEVEMENTS.UNLOCK_ACT_3_CHAMPIONS, 
 ACHIEVEMENTS.READ_FULL_PHONEBOOK, 
 ACHIEVEMENTS.GOOD, 
 ACHIEVEMENTS.PLUSGOOD, 
 ACHIEVEMENTS.DOUBLEPLUSGOOD, 
]

const DAILY_BLOCKED_ACHIEVEMENTS = [
 ACHIEVEMENTS.OVERALL_MAX_DIFFICULTY, 
 ACHIEVEMENTS.LEXICOGRAPHER_MAX_DIFFICULTY, 
 ACHIEVEMENTS.CHILD_MAX_DIFFICULTY, 
 ACHIEVEMENTS.JUBILIST_MAX_DIFFICULTY, 
 ACHIEVEMENTS.FISHER_MAX_DIFFICULTY, 
 ACHIEVEMENTS.ADDICT_MAX_DIFFICULTY, 

 ACHIEVEMENTS.GOOD, 
 ACHIEVEMENTS.PLUSGOOD, 


 SPELLS.RED_LETTER, 
 SPELLS.CLOWN_CACHE, 
 SPELLS.T_GEL, 
 SPELLS.CORKLINE, 
 SPELLS.DIME, 


 SPELLS.FLOPPY_DISK, 
 SPELLS.PRAXICE, 
 SPELLS.DAMAGED_GOODS, 
 SPELLS.FISHING_RIFLE, 
 SPELLS.PANIC_BUTTON, 


 SPELLS.POLITICAL_COMPASS, 
 SPELLS.RED_TAPE, 
]

const DIFFICULTY_ACHIEVEMENTS = [
 ACHIEVEMENTS.OVERALL_MAX_DIFFICULTY, 
 ACHIEVEMENTS.LEXICOGRAPHER_MAX_DIFFICULTY, 
 ACHIEVEMENTS.CHILD_MAX_DIFFICULTY, 
 ACHIEVEMENTS.JUBILIST_MAX_DIFFICULTY, 
 ACHIEVEMENTS.FISHER_MAX_DIFFICULTY, 
 ACHIEVEMENTS.ADDICT_MAX_DIFFICULTY, 
]

const QOL_ADJUSTMENT_COUNT = 500

const ACHIEVEMENT_COUNTS = {
 ACHIEVEMENTS.OVERALL_MAX_DIFFICULTY: 11, 
 ACHIEVEMENTS.LEXICOGRAPHER_MAX_DIFFICULTY: 11, 
 ACHIEVEMENTS.CHILD_MAX_DIFFICULTY: 11, 
 ACHIEVEMENTS.JUBILIST_MAX_DIFFICULTY: 11, 
 ACHIEVEMENTS.FISHER_MAX_DIFFICULTY: 11, 
 ACHIEVEMENTS.ADDICT_MAX_DIFFICULTY: 11, 
 ACHIEVEMENTS.QUALITY_OF_LIFE_ADJUSTMENT: QOL_ADJUSTMENT_COUNT, 
 ACHIEVEMENTS.UNLOCK_ACT_1_CHAMPIONS: 10, 
 ACHIEVEMENTS.UNLOCK_ACT_2_CHAMPIONS: 10, 
 ACHIEVEMENTS.UNLOCK_ACT_3_CHAMPIONS: 10, 
 ACHIEVEMENTS.READ_FULL_PHONEBOOK: 31 + 27, 

 ACHIEVEMENTS.PEE_YOUR_PANTS: 1, 


 ACHIEVEMENTS.PRONOUNS: 0, 
 ACHIEVEMENTS.HAZEL_PRONOUNS: 0, 
}

const ACHIEVEMENT_EXTRA_COUNTS = {
 ACHIEVEMENTS.OVERALL_MAX_DIFFICULTY: 1, 
 ACHIEVEMENTS.LEXICOGRAPHER_MAX_DIFFICULTY: 1, 
 ACHIEVEMENTS.CHILD_MAX_DIFFICULTY: 1, 
 ACHIEVEMENTS.JUBILIST_MAX_DIFFICULTY: 1, 
 ACHIEVEMENTS.FISHER_MAX_DIFFICULTY: 1, 
 ACHIEVEMENTS.ADDICT_MAX_DIFFICULTY: 1, 
 ACHIEVEMENTS.PEE_YOUR_PANTS: 1, 
}

const SUPER_SECRET_ACHIEVEMENTS = [
 ACHIEVEMENTS.PEE_YOUR_PANTS, 
]

const EXTRA_PERCENT = 6



const ACHIEVEMENT_POPUP_PRIORITY = {
 ACHIEVEMENTS.PRONOUNS: 1, 
 ACHIEVEMENTS.HAZEL_PRONOUNS: 2, 
 ACHIEVEMENTS.GOOD: 3, 
 ACHIEVEMENTS.PLUSGOOD: 4, 
 ACHIEVEMENTS.DOUBLEPLUSGOOD: 5, 
}

const ACHIEVEMENTS_COUNTED_AS_ONE = [
 ACHIEVEMENTS.QUALITY_OF_LIFE_ADJUSTMENT, 
 ACHIEVEMENTS.UNLOCK_ACT_1_CHAMPIONS, 
 ACHIEVEMENTS.UNLOCK_ACT_2_CHAMPIONS, 
 ACHIEVEMENTS.UNLOCK_ACT_3_CHAMPIONS, 
 ACHIEVEMENTS.READ_FULL_PHONEBOOK, 
]

const ALWAYS_UNLOCKABLE_ACHIEVEMENTS = [
 ACHIEVEMENTS.FIRST_RUN, 
 ACHIEVEMENTS.BEAT_FRIENDS_DAILY, 
 ACHIEVEMENTS.QUALITY_OF_LIFE_ADJUSTMENT, 
 ACHIEVEMENTS.LINGUISTIC_DRIFT, 
]

const STAT_ACHIEVEMENT_STEAM_KEYS = {
 ACHIEVEMENTS.LEXICOGRAPHER_MAX_DIFFICULTY: "lexicographer_completion", 
 ACHIEVEMENTS.CHILD_MAX_DIFFICULTY: "child_completion", 
 ACHIEVEMENTS.JUBILIST_MAX_DIFFICULTY: "jubilist_completion", 
 ACHIEVEMENTS.FISHER_MAX_DIFFICULTY: "fisher_completion", 
 ACHIEVEMENTS.ADDICT_MAX_DIFFICULTY: "addict_completion", 
}

const STAT_ACHIEVEMENT_NOTIFICATION_EXCLUDED_LEVELS = {
 ACHIEVEMENTS.LEXICOGRAPHER_MAX_DIFFICULTY: [5], 
 ACHIEVEMENTS.CHILD_MAX_DIFFICULTY: [5], 
 ACHIEVEMENTS.JUBILIST_MAX_DIFFICULTY: [5], 
 ACHIEVEMENTS.FISHER_MAX_DIFFICULTY: [5], 
 ACHIEVEMENTS.ADDICT_MAX_DIFFICULTY: [5], 
}

const CHALLENGE_ACHIEVEMENTS = [
 ACHIEVEMENTS.QUALITY_OF_LIFE_ADJUSTMENT, 
 ACHIEVEMENTS.LINGUISTIC_DRIFT, 
 ACHIEVEMENTS.PEE_YOUR_PANTS, 
 ACHIEVEMENTS.BEAT_FRIENDS_DAILY, 
]

const STEAM_ONLY_ACHIEVEMENTS = [
 ACHIEVEMENTS.BEAT_FRIENDS_DAILY, 
 SPELLS.SSN, 
]

const STEAM_ONLY_SPELLS = [
 SPELLS.SSN, 
]

const CHARACTER_DIFFICULTY_ACHIEVEMENTS = {
 CHARACTERS.LEXICOGRAPHER: ACHIEVEMENTS.LEXICOGRAPHER_MAX_DIFFICULTY, 
 CHARACTERS.CHILD: ACHIEVEMENTS.CHILD_MAX_DIFFICULTY, 
 CHARACTERS.JUBILIST: ACHIEVEMENTS.JUBILIST_MAX_DIFFICULTY, 
 CHARACTERS.FISHER: ACHIEVEMENTS.FISHER_MAX_DIFFICULTY, 
 CHARACTERS.ADDICT: ACHIEVEMENTS.ADDICT_MAX_DIFFICULTY, 
}

const CHARACTER_LOCKING_ACHIEVEMENTS = {
 CHARACTERS.CHILD: ACHIEVEMENTS.UNLOCK_CHILD, 
 CHARACTERS.JUBILIST: ACHIEVEMENTS.UNLOCK_JUBILIST, 
 CHARACTERS.FISHER: ACHIEVEMENTS.UNLOCK_FISHER, 
 CHARACTERS.ADDICT: ACHIEVEMENTS.UNLOCK_ADDICT, 
}

const HEARTS = {
 DEFAULT = 0, 
 PEOPLE = 1, 
 FIREBUG = 2, 
 BUG = 3, 
 ASH = 4, 
 ICE = 5, 
 ALIUM = 6, 
 COP = 7, 
 PLANT = 8, 
 PHONE = 9, 
 CHASER = 10
}

const BLOOD_COLORS = {
 HEARTS.DEFAULT: COLORS.BLOOD, 
 HEARTS.PEOPLE: COLORS.PEOPLE_BLOOD, 
 HEARTS.FIREBUG: COLORS.FIRE, 
 HEARTS.BUG: COLORS.XRAFSTAR_BLOOD, 
 HEARTS.ASH: COLORS.ASH, 
 HEARTS.ICE: COLORS.ICE, 
 HEARTS.ALIUM: COLORS.ALIUM_BLOOD, 
 HEARTS.COP: COLORS.COP_BLOOD, 
 HEARTS.PLANT: COLORS.CHLOROPHYLL, 
 HEARTS.PHONE: COLORS.SMOKE, 
 HEARTS.CHASER: COLORS.CHASER_PINK
}


func _input(event):
 if get_viewport().gui_get_focus_owner() is LineEdit:
  return

 if event.is_action_pressed("toggle_fullscreen"):
  SaveManager.set_fullscreen_setting( not SaveManager.get_fullscreen_setting())

 if event.is_action_pressed("toggle_mute"):
  if not SaveManager.get_music_muted() or not SaveManager.get_sound_muted():
   SaveManager.set_music_muted(true)
   SaveManager.set_sound_muted(true)
  else:
   SaveManager.set_music_muted(false)
   SaveManager.set_sound_muted(false)


func is_valid_achievement(achievement):
 if achievement in STEAM_ONLY_ACHIEVEMENTS and not Bridge.version_has_leaderboards():
  return false
 elif achievement in Globals.ACHIEVEMENT_COUNTS and Globals.ACHIEVEMENT_COUNTS[achievement] == 0:
  return false
 else:
  return true


func get_achievement_completion_count(achievement, count: = -1, count_extra: = false):
 if count < 1:
  return 0
 elif achievement in ACHIEVEMENT_COUNTS:
  if achievement in ACHIEVEMENTS_COUNTED_AS_ONE:
   if count >= ACHIEVEMENT_COUNTS[achievement]:
    return 1
   else:
    return 0
  else:
   var max_count: int = ACHIEVEMENT_COUNTS[achievement]
   if achievement in ACHIEVEMENT_EXTRA_COUNTS and not count_extra:
    max_count -= ACHIEVEMENT_EXTRA_COUNTS[achievement]

   return mini(max_count, count)
 else:
  return 1


func get_total_achievement_count(count_extra: = false) -> int:
 var total_count = 0
 for achievement in ACHIEVEMENTS.values() + SPELL_ACHIEVEMENTS:
  if not is_valid_achievement(achievement):
   continue

  var completion_count = get_achievement_completion_count(achievement, ACHIEVEMENT_COUNTS.get(achievement, 1), count_extra)
  total_count += completion_count

 return total_count


func get_achievement_percent(achievement_count: int, achievement_count_extra: int = -1, count_extra: = false) -> int:
 var total: = get_total_achievement_count()

 var achievement_ratio: = float(achievement_count) / float(total)
 var percent: int = floori(achievement_ratio * 100)

 if not count_extra:
  return percent

 var extra_achieved: = achievement_count_extra - achievement_count
 var total_with_extra: = get_total_achievement_count(true)
 var total_extra: = total_with_extra - total

 var extra_ratio: = float(extra_achieved) / float(total_extra)
 var extra_percent: int = floori(extra_ratio * EXTRA_PERCENT)

 return percent + extra_percent


func is_spell_unlocked(spell):
 if spell in STEAM_ONLY_SPELLS and not Bridge.has_steam():
  return false

 if spell not in SPELL_ACHIEVEMENTS:
  return true

 return AchievementManager.has_achievement(spell)


func _ready() -> void:
    print("using custom globals")
    print("spell pool"+str(load("res://mods/spell_framework/mod.gd").spell_pool))
    SpellData._static_init()

func get_spell_pool(category = null):
 print("loading custom spell pool")
 var spell_framework=load("res://mods/spell_framework/mod.gd")
 var weighted_spells = spell_framework.spell_pool
 var spell_pool = {}

 if category != null:
  weighted_spells = SPELL_CATEGORIES[category]

 for spell in weighted_spells:
  if is_spell_unlocked(spell):
   spell_pool[spell] = spell_framework.spell_pool[spell]
 print("spell pool "+str(spell_pool))
 return spell_pool


func get_categorized_spell_pool():
 var spell_categories = {}

 for category in SPELL_CATEGORIES.keys():
  spell_categories[category] = get_spell_pool(category)

 return spell_categories


func print_spell_report():
 var dry_spells = []
 var uncategorized_spells = []

 for key in SPELLS:
  var spell = SPELLS[key]
  var has_category = false

  if spell not in SPELL_POOL:
   dry_spells.append(spell)

  for category in SPELL_CATEGORIES.values():
   if spell in category:
    has_category = true

  if not has_category:
   uncategorized_spells.append(spell)

 var total_spell_count = SPELL_POOL.values().size()
 print("Spell count: ", total_spell_count, "\n")
 print("Unlockable count: ", SPELL_ACHIEVEMENTS.size(), "\n")
 print("Spells not in pool: ", dry_spells, "\n")
 print("Spells not in any category: ", uncategorized_spells, "\n")
 print("Category sizes:\nSupport: ", SPELL_CATEGORIES[SPELL_CATEGORY.SUPPORT].size(), "\nEnhancing: ", SPELL_CATEGORIES[SPELL_CATEGORY.OFFENSIVE].size(), "\nDefense: ", SPELL_CATEGORIES[SPELL_CATEGORY.DEFENSIVE].size())


func print_lotd_words():
 var lotds = {}

 for letter in Letters.ALPHABET:
  lotds[letter] = WordUtility.get_lotd_words(letter)

 for letter in lotds:
  print(letter, ":\n\t", lotds[letter])


func print_selling_points():
 print("Spells in pool: ", SPELL_POOL.size())
 print("Unlockable spells: ", SPELL_ACHIEVEMENTS.size())
 print("Enemies: ", Enemies.list(false).size())


func print_default_spells():
 for spell in SPELLS:
  if SPELLS[spell] not in SPELL_ACHIEVEMENTS:
   print(spell)


func is_difficulty_unlocked(difficulty: int, character: String = "") -> bool:
 if character == "":
  return AchievementManager.has_achievement(Globals.ACHIEVEMENTS.OVERALL_MAX_DIFFICULTY, difficulty)
 else:
  if not Globals.is_character_unlocked(character):
   return false

  var character_difficulty = Globals.CHARACTER_DIFFICULTY_ACHIEVEMENTS[character]
  return AchievementManager.has_achievement(character_difficulty, difficulty)


func get_max_difficulty(character: String = ""):
 if character == "":
  return AchievementManager.get_achievement_level(Globals.ACHIEVEMENTS.OVERALL_MAX_DIFFICULTY, true)
 else:
  var character_difficulty = Globals.CHARACTER_DIFFICULTY_ACHIEVEMENTS[character]
  return AchievementManager.get_achievement_level(character_difficulty, true)


func is_character_unlocked(character: String):
 if character in Globals.CHARACTER_LOCKING_ACHIEVEMENTS:
  return AchievementManager.has_achievement(Globals.CHARACTER_LOCKING_ACHIEVEMENTS[character])
 else:
  return true


func is_character_trans(id, difficulty):
 if difficulty == 10:
  return AchievementManager.has_achievement(CHARACTER_DIFFICULTY_ACHIEVEMENTS[id], 11)
 else:
  return difficulty > 0






func get_all_children(node: Node) -> Array[Node]:
 var children = node.get_children()
 for child in children:
  children.append_array(get_all_children(child))

 return children
