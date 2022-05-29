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

export const hide_synth_identity: FeatureToggle = {
  name: "Hide Synthetic Identity",
  description: "Do you want your identity to show up as human on things like medical scanners?",
  component: CheckboxInput,
};

export const synth_can_metabolize: FeatureToggle = {
  name: "Chemical Metabolizing",
  description: "Do you want to be able to metabolize and process chemicals?",
  component: CheckboxInput,
};

export const synth_hunger: FeatureToggle = {
  name: "Hunger",
  description: "Do you want to become hungry? Just like one of those regular organics?",
  component: CheckboxInput,
};
