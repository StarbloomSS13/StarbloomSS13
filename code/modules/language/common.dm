// 'basic' language; spoken by default.
/datum/language/common
	name = "Neo-Mandarin"
	desc = "The common tongue spoken aboard Arx. A descendant of Chinese, Korean, and Japanese."
	key = "0"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_UNDERSTOOD
	default_priority = 100

	icon_state = "galcom"

//Syllable Lists
/*
	This list really long, mainly because I can't make up my mind about which mandarin syllables should be removed,
	and the english syllables had to be duplicated so that there is roughly a 50-50 weighting.

	Sources:
	http://www.sttmedia.com/syllablefrequency-english
	http://www.chinahighlights.com/travelguide/learning-chinese/pinyin-syllables.htm
*/
/datum/language/common/syllables = list(
"ao", "bei", "cang", "dao", "er", "fei", "guang", "hong", "jie", "kuai", "lian", "miao", "nang", "ping", "quan", "rong", "sheng", "tiao", "wen", "xiang", "yuan", "zhuai",
 "jju", "yeol", "nyeo", "yuk", "seum", "geolli", "kkaji", "pal", "bun", "meo", "wol", "ato", "naka", "jikan", "ashi", "getsu", "toshi", "kuru", "mono", "suko", "shi", "tabe", "sono"
)
