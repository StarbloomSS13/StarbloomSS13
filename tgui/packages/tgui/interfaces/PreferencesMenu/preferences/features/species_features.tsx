import { FeatureChoiced, FeatureDropdownInput, Feature, FeatureColorInput, CheckboxInput, FeatureTriColorInput, FeatureTriBoolInput, FeatureToggle, FeatureTextInput, FeatureShortTextInput } from "./base";

export const eye_color: Feature<string> = {
  name: "Eye color",
  component: FeatureColorInput,
};

export const facial_hair_color: Feature<string> = {
  name: "Facial hair color",
  component: FeatureColorInput,
};

export const facial_hair_gradient: FeatureChoiced = {
  name: "Facial hair gradient",
  component: FeatureDropdownInput,
};

export const facial_hair_gradient_color: Feature<string> = {
  name: "Facial hair gradient color",
  component: FeatureColorInput,
};

export const hair_color: Feature<string> = {
  name: "Hair color",
  component: FeatureColorInput,
};

export const hair_gradient: FeatureChoiced = {
  name: "Hair gradient",
  component: FeatureDropdownInput,
};

export const hair_gradient_color: Feature<string> = {
  name: "Hair gradient color",
  component: FeatureColorInput,
};


export const feature_human_ears: FeatureChoiced = {
  name: "Ears",
  component: FeatureDropdownInput,
};

export const feature_human_tail: FeatureChoiced = {
  name: "Tail",
  component: FeatureDropdownInput,
};

export const feature_lizard_legs: FeatureChoiced = {
  name: "Legs",
  component: FeatureDropdownInput,
};

export const feature_lizard_spines: FeatureChoiced = {
  name: "Spines",
  component: FeatureDropdownInput,
};

export const feature_lizard_tail: FeatureChoiced = {
  name: "Tail",
  component: FeatureDropdownInput,
};

export const feature_mcolor: Feature<string> = {
  name: "Mutant color",
  component: FeatureColorInput,
};

export const underwear_color: Feature<string> = {
  name: "Underwear color",
  component: FeatureColorInput,
};

export const feature_vampire_status: Feature<string> = {
  name: "Vampire status",
  component: FeatureDropdownInput,
};


export const allow_emissives_toggle: FeatureToggle = {
  name: "Allow Emissives",
  description: "Time to become a glowstick.",
  component: CheckboxInput,
};

export const allow_mismatched_parts_toggle: FeatureToggle = {
  name: "Allow Mismatched Parts",
  description: "Want to go completely crazy with your character design? Use this to select any parts from any species!",
  component: CheckboxInput,
};

export const mutant_colors_color: Feature<string[]> = {
  name: "Mutant Colors",
  description: "Legacy colors for controlling shit.",
  component: FeatureTriColorInput,
};

export const eye_emissives: FeatureToggle = {
  name: "Eye Emissives",
  description: "Turn your eyes into sparklers.",
  component: CheckboxInput,
};

export const tail_toggle: FeatureToggle = {
  name: "Tail",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_tail: Feature<string> = {
  name: "Tail Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const tail_color: Feature<string[]> = {
  name: "Tail Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const tail_emissive: Feature<boolean[]> = {
  name: "Tail Emissives",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriBoolInput,
};

export const ears_toggle: FeatureToggle = {
  name: "Ears",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_ears: Feature<string> = {
  name: "Ears Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const ears_color: Feature<string[]> = {
  name: "Ears Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const ears_emissive: Feature<boolean[]> = {
  name: "Ears Emissives",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriBoolInput,
};

export const wings_toggle: FeatureToggle = {
  name: "Wings",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_wings: Feature<string> = {
  name: "Wings Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const wings_color: Feature<string[]> = {
  name: "Wings Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const wings_emissive: Feature<boolean[]> = {
  name: "Wings Emissives",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriBoolInput,
};

export const flavor_text: Feature<string> = {
  name: "Flavor Text",
  description: "Describe your character!",
  component: FeatureTextInput,
};

export const silicon_flavor_text: Feature<string> = {
  name: "Flavor Text (Silicon)",
  description: "Describe your cyborg/AI shell!",
  component: FeatureTextInput,
};

export const headshot: Feature<string> = {
  name: "Headshot",
  description: "Add an image to your character, visible on close examination. Requires it be formatted properly.",
  component: FeatureShortTextInput,
};

export const digitigrade_legs: FeatureChoiced = {
  name: "Legs",
  component: FeatureDropdownInput,
};

export const body_markings_toggle: FeatureToggle = {
  name: "Body Markings",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const horns_toggle: FeatureToggle = {
  name: "Horns",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_horns: Feature<string> = {
  name: "Horns Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const horns_color: Feature<string[]> = {
  name: "Horns Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const horns_emissive: Feature<boolean[]> = {
  name: "Horns Emissives",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriBoolInput,
};


export const spines_toggle: FeatureToggle = {
  name: "Spines",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_spines: Feature<string> = {
  name: "Spines Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const spines_color: Feature<string[]> = {
  name: "Spines Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const spines_emissive: Feature<boolean[]> = {
  name: "Spines Emissives",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriBoolInput,
};

export const snout_toggle: FeatureToggle = {
  name: "Snout",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_snout: Feature<string> = {
  name: "Snout Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const snout_color: Feature<string[]> = {
  name: "Snout Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const snout_emissive: Feature<boolean[]> = {
  name: "Snout Emissives",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriBoolInput,
};

export const frills_toggle: FeatureToggle = {
  name: "Frills",
  description: "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_frills: Feature<string> = {
  name: "Frills Selection",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureDropdownInput,
};

export const frills_color: Feature<string[]> = {
  name: "Frills Colors",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriColorInput,
};

export const frills_emissive: Feature<boolean[]> = {
  name: "Frills Emissives",
  description: "Want to have a fancy species name? Put it here, or leave it blank.",
  component: FeatureTriBoolInput,
};
