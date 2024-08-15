## Features

- Parses dialogue or book events per scene in more or less sequential order
- Includes certain conditions/reactivity with race, class, deity, mythic path, romance states, passive/active skill checks, etc.

![Pasted image 20240815093652.png]

## Requirements

1. Patience
2. Visual Studio Code or any other code editor
3. basic PowerShell knowledge

## Instructions

### Setup

1. Create a folder for your workspace, like “WOTR Dialogue” or whatever
2. Place `ExtractDialogueTree.ps1` inside the folder
3. Go to your game files: `Pathfinder Second Adventure`/`Wrath_Data`/`Streaming_Assets`/`Localization` and copy the `enGB.json` file into your workspace folder
4. Go back to your game files and in the root folder (Pathfinder Second Adventure), copy `blueprints.zip` into a different folder (NOT the workspace folder) and unzip it. This’ll take a while.
5. Inside the blueprints folder, go to: `World`/`Dialogs`. Copy everything inside into your workspace folder. All the files and folders.

### Use

1. Open your workspace folder in VS Code. Create a PowerShell terminal in the editor (`Terminal` → `New Terminal`).
      1. You can also just open a separate terminal window and `cd` your way into the workspace directory and execute the script from there, but it’ll be easier inside VS Code / other IDE because you can easily browse through the files and folders.
2. Execute the script by typing `.\ExtractDialogueTree.ps1` into the terminal. If it gives you an error, you might need to right-click Properties and give it permissions under the Security tab
3. It’ll prompt you with `Enter directory:`
    This would be a good time to familiarize yourself with the contents of the Dialogs folder. c0/1/2/3/4/5/6 are basically folders for each chapter/act of the game, with c0 as the prologue and c6 as the endgame. Companions folder contains dialogue for companion quests and romances, etc.
      1. Inside each chapter folder they’re more or less separated by location but not always. The folder names are descriptive enough to tell you where/what it is anyway
      2. Also note that some of the name spellings in the folders aren’t what’s in the game (for example, the file name has “Camelia” instead of “Camellia”, etc), so you’ll have to double check that you have the correct folder/file name every now and then.
4. In this example, we’re going to parse Lann’s first dialogue meeting the player. This directory will be: `c0\CavesUnderKenabres\MeetLann`. Enter that text into the prompt.
      1. You’ll probably have to manually type it instead of copy-pasting!
      2. Also note that it’s a backslash (\\) not a forward slash (/)!
5. Next, it’ll prompt you with three choices:
   ```
   [1] - MeetLann
   [2] - MeetLann_Dialogue
   [3] - MeetLann_Dialog
   ```
   What this means is it’s asking what the root/entry point dialogue file is. Each dialogue folder has one, and it’s usually the file that isn’t named “Cue\_####” or “Answer\_####”, and most of the time it has the folder name in the file name.
   In this case, the entry point is `MeetLann.jbp`, which means you can enter the number `1` into the prompt and press Enter.
   If the entry point file name isn’t listed in the choices, just enter what the actual file name is. Do NOT include the file extension `jbp`, ie, if the file name is `SavedCrusader_AfterFireTrap.jbp`, then only enter `SavedCrusader_AfterFireTrap`.
6. If you’ve done it correctly, it should start parsing! The output will be a `.txt` file with the same file name as the entry point, ie, `MeetLann.txt`, and there should be an auto-generated log file as well for troubleshooting (the log file gets overwritten with every script execution).

## Limitations

- For certain dialogue scenes, the speaker isn’t clearly indicated in the output files (or I have yet to figure out how to parse it automatically). This usually happens in companion quests/romance dialogue scenes so it’s a bit easier to guess who’s actually speaking... sometimes.
  - It also doesn’t have the complete list of speaker IDs yet, only companions and major NPCs, so some of the output files might have an empty speaker name... if that happens you’ll need to look at the `blueprints`/`Units` folder and search the ID there.
- It doesn’t have a full list of the etudes/conditions (like quest markers/companion etudes) required for certain scenes.
- It’s a very convoluted process due to this being mostly a personal project… I’m looking into parsing all the dialogue at once and uploading a repository of it somewhere but for now you’re gonna have to parse it yourself
- This has only been tested for Pathfinder: Wrath of the Righteous, and even then, only for select scenes. Not sure if it’ll work with other Owlcat games

## Troubleshooting / Feedback

For any questions or troubleshooting help, send me a message on [@bladesmitten](https://bladesmitten.tumblr.com/) at Tumblr, or drop me a line at 10kph@proton.me. Feel free to open a pull request or any issues as well.
