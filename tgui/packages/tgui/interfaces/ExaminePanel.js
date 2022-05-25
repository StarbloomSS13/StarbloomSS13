import { useBackend } from '../backend';
import { Stack, Section, ByondUi } from '../components';
import { Window } from '../layouts';
import { resolveAsset } from '../assets';

export const ExaminePanel = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    character_name,
    obscured,
    flavor_text,
    headshot,
  } = data;
  return (
    <Window
      title="Examine Panel"
      width={900}
      height={670}
      theme="admin">
      <Window.Content>
        <Stack fill>
          <Stack.Item>
            {headshot &&
              <Section height="310px" title="Headshot">
                <img
                  src={resolveAsset(headshot)}
                  height="250px"
                  width="250px"
                />
              </Section>
            }

          </Stack.Item>
        <Stack.Item grow>
          <Stack fill vertical>
            <Stack.Item grow>
              <Section scrollable fill title={character_name + "'s Flavor Text:"}
                preserveWhitespace>
                {flavor_text}
              </Section>
            </Stack.Item>
          </Stack>
        </Stack.Item>
        </Stack>
      </Window.Content>
    </Window >
  );
};
