function GetJsonFromFile {
  param ( [string]$Path )

  $jsonContent = Get-Content -Path $Path -Raw
  $jsonObject = $jsonContent | ConvertFrom-Json

  return $jsonObject
}

$logFile = "log.txt"
Set-Content -Path $logFile -Value "" # Overwrite contents of log file

function Log {
  param ( [string]$message )

  $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

  $logEntry = "${timestamp} - ${message}"

  Add-Content -Path $logFile -Value $logEntry
  Write-Output $logEntry
}

$SpeakerDict = @{
  # Companions
  "!bp_a352873d37ec6c54c9fa8f6da3a6b3e1" = "Arueshalae"
  "!bp_e3bc95db7e2181d41847b3a1d858258d" = "Evil Arueshalae"
  "!bp_397b090721c41044ea3220445300e1b8" = "Camellia"
  "!bp_096fc4a96d675bb45a0396bcaa7aa993" = "Daeran" # Companion version
  "!bp_54baba4efada97d44837ca9fddf4e7ee" = "Daeran" # NPC version
  "!bp_2779754eecffd044fbd4842dba55312c" = "Ember"
  "!bp_ea8034769ab7d584e97b5227cbc03296" = "Finnean"
  "!bp_f72bb7c48bb3e45458f866045448fb58" = "Greybor"
  "!bp_cb29621d99b902e4da6f5d232352fbda" = "Lann"
  "!bp_1b893f7cf2b150e4f8bc2b3c389ba71d" = "Nenio"
  "!bp_0d37024170b172346b3769df92a971f5" = "Regill"
  "!bp_54be53f0b35bf3c4592a97ae335fe765" = "Seelah"
  "!bp_1cbbbb892f93c3d439f8417ad7cbb6aa" = "Sosiel"
  "!bp_42f0d5ec3dc844feb44b04507a7c1bfc" = "Ulbrig"
  "!bp_ae766624c03058440a036de90a7f2009" = "Wenduag"
  "!bp_766435873b1361c4287c351de194e5f9" = "Woljif"

  # NPCs
  "!bp_32a037e97c3d5c54b85da8f639616c57" = "Aivu"
  "!bp_ea562adea1736874c9c5616d140fe773" = "Anevia"
  "!bp_a609ed9b2205d034bb3bb04d2a255681" = "Arsinoe"
  "!bp_9cbdad39cf0e7614da9453c7bed90210" = "Balor Marauder" # Evil Arue Intro
  "!bp_00b0b86cebbf94347b8ad7a1855ff100" = "Baphomet Cultist"
  "!bp_5d7026322edda04448d9f6d252c135c9" = "Chief Sull"
  "!bp_2b3afefada061974fb3c29f86f033d54" = "Corrupted Mongrel Brute"
  "!bp_2e0c945a8ecacef40b8661815ad1d651" = "Deskari Cultist"
  "!bp_0c4b24a1f9dd73c4f925ed79166ff481" = "Dimalchio"
  "!bp_8a863b65171271a44abdeded092a628f" = "Elan of the Houndhearts"
  "!bp_ba4d057e32bd2984f969bc781da523ba" = "Hand of the Inheritor"
  "!bp_fff912fcbfbbc364e84ae5ea9384db89" = "Hand of the Inheritor"
  "!bp_c02e641bf8cf0984fb49604afa224563" = "Horgus Gwerm"
  "!bp_64dcc27d70edc1148b31257fcc2241ce" = "Hosilla"
  "!bp_77fbcde261cd4396bba5d9fe0b2c57c6" = "Hulrun"
  "!bp_d1e567736abf23943b9f041ba7a0bc23" = "Irabeth"
  "!bp_e778129f817a5fa4286e64b061df84a5" = "Irabeth"
  "!bp_280d4712dceb37f4a88e98f1f4c6e64f" = "Irabeth"
  "!bp_48cc2d6daf65f014781f6ea76c2565bc" = "Irabeth"
  "!bp_bbcd85f6c1762364ba48be9f72f115ae" = "Minagho" # Grey Garrison
  "!bp_0b6bf63794421f3468e8e7c2319b16a0" = "Mongrel"
  "!bp_4743027ef615a57478e630bf6f7c48e3" = "Neophyte Cleric"
  "!bp_e881dabcd5323ae4bb5f90da2b763edf" = "Nightmare Spawn" # Arue Q3 Dream
  "!bp_97d1c33c784100140b9fa317aef5a499" = "Queen Galfrey"
  "!bp_90215a976d13b254ab905d0d6f747deb" = "Recruit" # Prologue Suture
  "!bp_56e5b923077a00343927c134e3e45d69" = "Robust Corrupted Mongrel Brute"
  "!bp_25ad116e1f5008e488b13f9b968596d4" = "Rokhorn" # Arue C4 Brothel
  "!bp_b5b6da90a7adec74c8a64d1983593989" = "Savamelekh"
  "!bp_eeb538e80b362fc4d9a8c2f8937e824e" = "Shadow" # Arue C4 Nightmare
  "!bp_6acb78ccf5defa6418e84ab0bad57763" = "Shadow" # Arue C4 Nightmare
  "!bp_34d714bc5f83e9a45810f1c73f172755" = "Staunton Vhane"
  "!bp_8349367760344cae9dc04b2222bb75a5" = "Staunton Vhane"
  "!bp_da4c28dd01413694f82b08b728a8c6e5" = "Storyteller"
  "!bp_2db556136eac2544fa9744314c2a5713" = "Succubus Guard" # Arue Q2 Dimalchio
  "!bp_045e2ea911644fa0abaa2f6c76b83feb" = "Terendelev"
  "!bp_1250edc804a3d904db28ea4db5893eab" = "Yaker"
  "!bp_f79a0641d61ac714fb9142030d023bfc" = "Yaker"
}

$CondTypeDict = @{
  "ea981728db8a5f84888ecba390671a05, EtudeStatus"              = "Etude"
  "f310985bf2724df4a97b165f74b806e8, HasFact"                  = "Fact"
  "294fa514f9b7760448adbaa37eb1dbfa, PcRace"                   = "Race"
  "68c8570f3f0aabb44b1e237b4a025030, PlayerSignificantClassIs" = "Class"
}

$EtudeDict = @{
  # Mythic Paths
  "!bp_18d61dafb9bf8ec45bbb379b661556ac" = "AngelUnlocked"
  "!bp_56ccf51b9bd0cc648afe66ae5f4f5115" = "DemonUnlocked"
  "!bp_3a040afde22f4b742a2f607354ab17e7" = "PlayerIsAeon"
  "!bp_3a82aba4de71b89458ac82949ed957c4" = "PlayerIsAngel"
  "!bp_d3b47e973d65c6c46af1cce815d1f6ce" = "PlayerIsAzata"
  "!bp_9a3739370f84b0b4196d0e4d326ea3a8" = "PlayerIsDemon"
  "!bp_a1db9daf676b36f4d99c6a788a0fe1af" = "PlayerIsDevil"
  "!bp_9b193d30c89a20b409fd3dda9bd109bf" = "PlayerIsDragon"
  "!bp_c6165efcd5571c442ae38d7c0601f2df" = "PlayerIsLegend"
  "!bp_11fc5662e0ce8074ea145a022282b879" = "PlayerIsLich"
  "!bp_439e63fed37f52048887d98f99255e40" = "PlayerIsLocust"
  "!bp_9f486a9c0c9abfc4a952bb22e88a7e96" = "PlayerIsTrickster"
  # Character & Romance States
  "!bp_e85e8acd74d231e44ad7d6d2d5dab43c" = "ArueshalaeIsEvil"
  "!bp_6a3fdd0758fe78d4aa2c3b26d7614fbc" = "ArueshalaeRomance_Active"
  "!bp_0bf858595db93e644ba1de4b53b6d3f9" = "ArueshalaeRomance_DemonRedeemed"
  "!bp_e49702f590611644580f09c8f9ef0e5b" = "CamelliaRomance_Start"
  "!bp_8541453b31379964e834cf2309444388" = "DaeranRomance_Active"
  "!bp_af394a43ba7c1314bb31aea74a5e4c0e" = "LannRomance_Active"
  "!bp_efb130b8a22c9534ca40a1e41ef8e931" = "SosielRomance_Active"
  "!bp_33c4c2f66f2461e4993df21566252079" = "WenduagRomance_Active"
}

$FactDict = @{
  # Deities
  "!bp_6122dacf418611540a3c91e67197ee4e" = "AbadarFeature"
  "!bp_d714ecb5d5bb89a42957de0304e459c9" = "AreshkagalFeature"
  "!bp_a3a5ccc9c670e6f4ca4a686d23b89900" = "AsmodeusFeature"
  "!bp_92c0d2da0a836ce418a267093c09ca54" = "AtheismFeature"
  "!bp_bd72ca8ffcfec5745899ac56c93f12c5" = "BaphometFeature"
  "!bp_c7531715a3f046d4da129619be63f44c" = "CalistriaFeature"
  "!bp_300e212868bca984687c92bcb66d381b" = "CaydenCaileanFeature"
  "!bp_ddf913858bdf43b4da3b731e082fbcc0" = "DeskariFeature"
  "!bp_2c0a3b9971327ba4d9d85354d16998c1" = "DesnaFeature"
  "!bp_afc775188deb7a44aa4cbde03512c671" = "ErastilFeature"
  "!bp_c4403567ea9e5fe478ca38e3052fadc2" = "ForbiddenDeityFeature"
  "!bp_583a26e88031d0a4a94c8180105692a5" = "GodClawFeature"
  "!bp_8f49a5d8528a82c44b8c117a89f6b68c" = "GorumFeature"
  "!bp_4af983eec2d821b40a3065eb5e8c3a72" = "GozrehFeature"
  "!bp_ca763809e01f4247a3639965364c26cb" = "GreenFaithCameliaFeature"
  "!bp_99a7a8f13c1300c42878558fa9471e2f" = "GreenFaithFeature"
  "!bp_c3e4d5681906d5246ab8b0637b98cbfe" = "GroetusFeature"
  "!bp_8b535b6842e063d48a571a042c3c6e8f" = "GyronnaFeature"
  "!bp_88d5da04361b16746bf5b65795e0c38c" = "IomedaeFeature"
  "!bp_23a77a5985de08349820429ce1b5a234" = "IroriFeature"
  "!bp_f12c1ccc9d600c04f8887cd28a8f45a5" = "KabririFeature"
  "!bp_f86bc8fbf13221f4f9041608a1fb8585" = "LamashtuFeature"
  "!bp_b4153b422d02d4f48b3f8f0ceb6a10eb" = "LichDeityFeature"
  "!bp_6262cfce7c31626458325ca0909de997" = "NethysFeature"
  "!bp_805b6bdc8c96f4749afc687a003f9628" = "NorgorberFeature"
  "!bp_458750bc214ab2e44abdeae404ab22e9" = "PharasmaFeature"
  "!bp_ebb0b46f95dbac74681c78aae895dbd0" = "PuluraFeature"
  "!bp_04bc2b62273ab744092d992ed72bff41" = "RovagugFeature"
  "!bp_c1c4f7f64842e7e48849e5e67be11a1b" = "SarenraeFeature"
  "!bp_b382afa31e4287644b77a8b30ed4aa0b" = "ShelynFeature"
  "!bp_d2d5c5a58885a6b489727467e13c3337" = "ToragFeature"
  "!bp_812f6c07148088e41a9ac94b56ac2fc8" = "UrgathoaFeature"
  "!bp_f7eed400baa66a744ad361d4df0e6f1b" = "ZonKuthonFeature"
}

$ClassDict = @{
  "!bp_0937bec61c0dabc468428f496580c721" = "Alchemist"
  "!bp_9c935a076d4fe4d4999fd48d853e3cf3" = "ArcaneTrickster"
  "!bp_52dbfd8505e22f84fad8d702611f60b7" = "Arcanist"
  "!bp_eb284ea8d40a2d045911f525eb96c43d" = "Assassin"
  "!bp_f7d7eb166b3dd594fb330d085df41853" = "Barbarian"
  "!bp_772c83a25e2268e448e841dcd548235f" = "Bard"
  "!bp_d77e67a814d686842802c9cfd8ef8499" = "Bloodrager"
  "!bp_3adc3439f98cb534ba98df59838f02c7" = "Cavalier"
  "!bp_67819271767a9dd4fbfd4ae700befea0" = "Cleric"
  "!bp_72051275b1dbb2d42ba9118237794f7c" = "DragonDisciple"
  "!bp_610d836f3a3a9ed42a4349b62f002e96" = "Druid"
  "!bp_4e0ea99612ae87a499c7fb0588e31828" = "Duelist"
  "!bp_de52b73972f0ed74c87f8f6a8e20b542" = "Eldritch"
  "!bp_48ac8db94d5de7645906c7d0ad3bcfbd" = "Fighter"
  "!bp_ed246f1680e667b47b7427d51e651059" = "Hellknight"
  "!bp_ee6425d6392101843af35f756ce7fefd" = "HellknightSignifier"
  "!bp_34ecd1b5e1b90b9498795791b0855239" = "Hunter"
  "!bp_f1a70d9e1b0b41e49874e1fa9052a1ce" = "Inquisitor"
  "!bp_42a455d9ec1ad924d889272429eb8391" = "Kineticist"
  "!bp_4a7c05adfbaf05446a6bf664d28fb103" = "Loremaster"
  "!bp_45a4607686d96a1498891b3286121780" = "Magus"
  "!bp_f5b8c63b141b2f44cbb8c2d7579c34f5" = "MagusEldritchScion"
  "!bp_e8f21e5b58e0569468e420ebea456124" = "Monk"
  "!bp_0920ea7e4fd7a404282e3d8b0ac41838" = "MysticTheurge"
  "!bp_20ce9bf8af32bee4c8557a045ab499b1" = "Oracle"
  "!bp_bfa11238e7ae3544bbeb4d0b92e897ec" = "Paladin"
  "!bp_cda0615668a6df14eb36ba19ee881af6" = "Ranger"
  "!bp_299aa766dee3cbf4790da4efb8c72484" = "Rogue"
  "!bp_145f1d3d360a7ad48bd95d392c81b38e" = "Shaman"
  "!bp_a406d6ebea5c46bba3160246be03e96f" = "Shifter"
  "!bp_6afa347d804838b48bda16acb0573dc0" = "Skald"
  "!bp_c75e0971973957d4dbad24bc7957e4fb" = "Slayer"
  "!bp_b3a505fb61437dc4097f43c3f8f9a4cf" = "Sorcerer"
  "!bp_d5917881586ff1d4d96d5b7cebda9464" = "StalwartDefender"
  "!bp_46b1fe9759ea01f4d883b23d8f0aecbb" = "StudentOfWar"
  "!bp_90e4d7da3ccd1a8478411e07e91d5750" = "Swordlord"
  "!bp_30b5e47d47a0e37438cc5a80c96cfb99" = "Warpriest"
  "!bp_eb24ca44debf6714aabe1af1fd905a07" = "WinterWitch"
  "!bp_1b9873f1e7bfe5449bc84d03e9c8e3cc" = "Witch"
  "!bp_ba34257984f4c41408ce1dc2004e342e" = "Wizard"
}

$directory = Read-Host -Prompt "Enter directory"

if (Test-Path $directory -PathType Container) {

}
else {
  Log -message "ERROR: Directory ${directory} does not exist"
  throw
}

if ($directory -match '\\([^\\]*)$') {
  $folderName = $Matches[1]
  $folderDialogue = "${folderName}_Dialogue"
  $folderDialog = "${folderName}_Dialog"

  Write-Host "[1] - ${folderName}"
  Write-Host "[2] - ${folderDialogue}"
  Write-Host "[3] - ${folderDialog}"
}

$inputPrompt = Read-Host -Prompt "Enter number OR file name"

if ($inputPrompt -match '^\d+$') {
  switch ($inputPrompt) {
    "1" {
      $inputFile = $folderName
    }
    "2" {
      $inputFile = $folderDialogue
    }
    "3" {
      $inputFile = $folderDialog
    }
  }
}
else {
  $inputFile = $inputPrompt
}

$fullPath = "${directory}\${inputFile}.jbp"

if (Test-Path $fullPath) {
  Log -message "File ${fullPath} found"
}
else {
  Log -message "ERROR: File ${fullPath} does not exist"
  throw
}

$outputFile = "${inputFile}.txt"
Set-Content -Path $outputFile -Value "" 

Log -message "Extraction started for file: ${directory}\${inputFile}"

$object = GetJsonFromFile -Path $fullPath

Log -message "JSON object extracted from file: ${fullPath}"

$localObj = GetJsonFromFile -Path "enGB.json"

Log -message "JSON object extracted from localization file"

$firstCue = $object.Data.FirstCue.Cues

Log -message "FirstCue Cue IDs: ${firstCue}"

function WriteToFile {
  param ( [string]$message )

  Add-Content -Path $outputFile -Value $message
}

function SearchCue {
  param ( [string]$SearchTerm )

  $searchResults = Get-ChildItem -Path $directory -Recurse | Where-Object { $_.GetType().Name -eq "FileInfo" } | ForEach-Object {
    Select-String -Path $_.FullName -Pattern $SearchTerm -SimpleMatch -List
  }

  return $searchResults
}

function GetConditions {
  param ( [Object]$obj )

  Log -message "Start condition extraction"

  $op = $obj.Operation

  $condString = "Conditions: "
  $condFound = $false

  $conditionArray = $obj.Conditions

  foreach ($cond in $conditionArray) {
    $currCondFound = $false
    $condTypeKey = $cond | Get-Member -MemberType NoteProperty | Where-Object { $_.Name -eq '$type' } | ForEach-Object { $cond.$($_.Name) }
    $condType = $CondTypeDict[$condTypeKey]

    switch ($condType) {
      "Etude" {
        $etudeKey = $cond.m_Etude
        Log -message "Condition type: Etude"
        try {
          $etude = $EtudeDict[$etudeKey]
        }
        catch {
          Log -message "Etude ${etudeKey} not found"
        }
        if ($etude.Length -gt 0) {
          $not = $cond.Not
          if ($not -eq $true) {
            $condString += "Not "
          }
          $condString += "${etude}"
          $condFound = $true
          $currCondFound = $true
          Log -message "Etude found: ${etude}"
        }
        else {
          Log -message "Etude ${etudeKey} not found"
        }
      }
      "Fact" {
        $factKey = $cond.m_Fact
        Log -message "Condition type: Fact"
        try {
          $fact = $FactDict[$factKey]
        }
        catch {
          Log -message "Fact ${factKey} not found"
        }
        if ($fact.Length -gt 0) {
          $condString += "${fact}"
          $condFound = $true
          $currCondFound = $true
          Log -message "Fact found: ${fact}"
        }
        else {
          Log -message "Fact ${factKey} not found"
        }
      }
      "Race" {
        $race = $cond.Race
        $not = $cond.Not
        if ($not -eq $true) {
          $condString += "Not "
        }
        $condString += "${race}"
        $condFound = $true
        $currCondFound = $true
        Log -message "Condition type: Race - ${race}"
      }
      "Class" {
        Log -message "Condition type: Class"
        $classKey = $cond.m_CharacterClass
        try {
          $class = $ClassDict[$classKey]
        }
        catch {
          Log -message "Class ${classKey} not found"
        }
        if ($class.Length -gt 0) {
          $not = $cond.Not
          if ($not -eq $true) {
            $condString += "Not "
          }
          $condString += "${class}"
          $condFound = $true
          $currCondFound = $true
          Log -message "Class found: ${class}"
        }
        else {
          Log -message "Class ${classKey} not found"
        }
      }
      default {
        Log -message "Condition type not found"
      }
    }
    if ($cond -ne $conditionArray[-1] -and $currCondFound -eq $true) {
      $condString += " ${op} "
    }
  }

  if ($condFound -eq $true) {
    Log -message $condString
    WriteToFile -message $condString
  }

  Log -message "End condition extraction"
}

function GetAlignmentShift {
  param ( [Object]$obj )

  $alignment = $obj.Direction
  $descKey = $obj.Description.m_Key
  
  $shared = ""
  $shared = $obj.Description.Shared.stringkey

  if (($null -eq $descKey -or $descKey.Length -eq 0) -and ($shared.Length -eq 0 -or $null -eq $shared)) {
    $desc = "No description"
  }
  elseif (($descKey.Length -eq 1 -or $null -ne $descKey) -and ($shared.Length -eq 0 -or $null -eq $shared)) {
    $desc = $localObj.strings | Select-Object -ExpandProperty $descKey
  }
  elseif ($null -ne $shared) {
    $desc = $localObj.strings | Select-Object -ExpandProperty $shared
  }

  $alignmentShift = "Alignment Shift: ${alignment} - ${desc}"
  Log -message $alignmentShift
  WriteToFile -message $alignmentShift
}

function GetAnswerList {
  param ( [string]$Key )

  if ($Key -eq $null) {
    return
  }

  $results = SearchCue -SearchTerm $Key

  foreach ($res in $results) {
    $name = $res.Filename
    $path = $res.Path
    $obj = GetJsonFromFile -Path $path
  
    $assetId = $obj.AssetId
    if ($assetId -eq $Key -and (-not $SeenAnswers.Contains($Key))) {
      Log -message "Answer list file found with file name ${name}"
      break
    }
  }

  if (-not $SeenAnswers.Contains($Key)) {
    $SeenAnswers.Add($Key)
    Log -message "Added Seen flag to ${name}"

    $answerList = $obj.Data.Answers

    foreach ($answer in $answerList) {
      $answerKey = $answer.Substring(4)
  
      GetAnswers -Key $answerKey
    }

    # not an answer list, most likely coming from a book page event
    if ($null -eq $answerList -or $answerList.Count -eq 0) {
      ExtractLine -obj $obj

      $nextCueKey = $obj.Data.NextCue.Cues
      foreach ($nxt in $nextCueKey) {
        $nxtId = $nxt.Substring(4)
        Log -message "Next cue key: ${nxtId}"

        GetDialogue -Key $nxtId
      }
    }
  }
}

$SeenAnswers = New-Object System.Collections.Generic.List[System.Object]

function ExtractLine {
  param ( [Object]$obj )

  # assuming the file is a BlueprintDialog file
  $dialogueKey = $obj.Data.Text.m_Key
  # check first if Shared property has a value
  $shared = ""
  $shared = $obj.Data.Text.Shared.stringkey
  $checkType = $obj.Data.ShowCheck.Type

  # if passive skill check
  if ($checkType -ne "Unknown") {
    if ($checkType.Length -gt 1 -and $checkType -ne "Unknown") {
      Log -message "Dialogue is a skill check: ${checkType}"
      
      $checkSuccessKey = $obj.Data.ShowCheck.DC
      Log -message "${checkType} Success: "
      Add-Content -Path $outputFile -Value "${checkType} Success: "
    }
  }

  if ($dialogueKey.count -eq 0 -or $null -eq $dialogueKey) {
    # if it's a skill check
    $checkType = $obj.Data.Type
    if ($checkType.Length -gt 1 -and $checkType -ne "Unknown") {
      Log -message "Dialogue is a skill check: ${checkType}"
      
      $checkSuccessKey = $obj.Data.m_Success
      $checkSuccess = $checkSuccessKey.Substring(4)
      Log -message "${checkType} Success: "
      Add-Content -Path $outputFile -Value "${checkType} Success: "
      GetDialogue -Key $checkSuccess

      $checkFailKey = $obj.Data.m_Fail
      $checkFail = $checkFailKey.Substring(4)
      Log -message "${checkType} Fail: "
      Add-Content -Path $outputFile -Value "${checkType} Fail: "
      GetDialogue -Key $checkFail
    }
    
  }
  elseif (($dialogueKey.count -eq 1 -or $null -ne $dialogueKey) -and ($shared.Length -eq 0)) {
    Log -message "Dialogue key: ${dialogueKey}"
  
    $speakerKey = $obj.Data.Speaker.m_Blueprint
    if ($null -eq $speakerKey) {
      $speakerKey = $obj.Data.Speaker.m_SpeakerPortrait

      if ($null -eq $speakerKey) {
        $speaker = "Player"
        Log -message "No speaker key found, assuming Player"
      }
      else { 
        $speaker = $SpeakerDict[$speakerKey]
        Log -message "Speaker found through SpeakerPortrait: ${speaker}"
      }
    }
    else {
      $speaker = $SpeakerDict[$speakerKey]
      Log -message "Speaker found: ${speaker}"
    }
    
    $dialogue = $localObj.strings | Select-Object -ExpandProperty $dialogueKey
    Log -message "${speaker}: ${dialogue}"
    
    Add-Content -Path $outputFile -Value "${speaker}: ${dialogue}`n"
  }
  else {
    Log -message "Dialogue found through Shared key: ${shared}"
  
    $speakerKey = $obj.Data.Speaker.m_Blueprint
    if ($null -eq $speakerKey) {
      $speakerKey = $obj.Data.Speaker.m_SpeakerPortrait

      if ($null -eq $speakerKey) {
        $speaker = "Player"
        Log -message "No speaker key found, assuming Player"
      }
      else { 
        $speaker = $SpeakerDict[$speakerKey]
        Log -message "Speaker found through SpeakerPortrait: ${speaker}"
      }
    }
    else {
      $speaker = $SpeakerDict[$speakerKey]
      Log -message "Speaker found: ${speaker}"
    }
    
    $dialogue = $localObj.strings | Select-Object -ExpandProperty $shared
    Log -message "${speaker}: ${dialogue}"
    
    Add-Content -Path $outputFile -Value "${speaker}: ${dialogue}`n"
  }
}

function GetAnswers {
  param ( [string]$Key )

  if ($Key -eq $null) {
    return
  }

  $results = SearchCue -SearchTerm $Key

  foreach ($res in $results) {
    $name = $res.Filename
    $path = $res.Path
    $obj = GetJsonFromFile -Path $path
  
    $assetId = $obj.AssetId
    if ($assetId -eq $Key -and (-not $SeenAnswers.Contains($Key))) {
      Log -message "Answer file found with file name ${name}"
      break
    }
  }

  if (-not $SeenAnswers.Contains($Key)) {
    $SeenAnswers.Add($Key)
    Log -message "Added Seen flag to ${name}"

    $condObj = $obj.Data.ShowConditions
    $condArr = $condObj.Conditions

    if ($condArr.Count -gt 0) {
      Log -message "Conditions array has value"
      GetConditions -obj $condObj
    }

    $alignObj = $obj.Data.AlignmentShift
    $alignShift = $alignObj.Direction

    if ($null -ne $alignObj -and $alignShift -ne "TrueNeutral") {
      Log -message "Alignment shift found"
      GetAlignmentShift -obj $alignObj
    }

    ExtractLine -obj $obj

    $nextCueKey = $obj.Data.NextCue.Cues
    foreach ($nxt in $nextCueKey) {
      $nxtId = $nxt.Substring(4)
      Log -message "Next cue key: ${nxtId}"

      GetDialogue -Key $nxtId
    }
  }
}

function GetDialogue {
  param ( [string]$Key )

  if ($Key -eq $null) {
    return
  }

  $results = SearchCue -SearchTerm $Key
  
  foreach ($res in $results) {
    $name = $res.Filename
    $path = $res.Path
    $obj = GetJsonFromFile -Path $path
  
    $assetId = $obj.AssetId
    if ($assetId -eq $Key -and (-not $SeenAnswers.Contains($Key))) {
      Log -message "Dialogue file found with file name ${name}"
      break
    }
  }

  if (-not $SeenAnswers.Contains($Key)) {
    $SeenAnswers.Add($Key)
    Log -message "Added Seen flag to ${name}"

    $condObj = $obj.Data.Conditions
    $condArr = $condObj.Conditions

    if ($condArr.Count -gt 0) {
      Log -message "Conditions array has value"
      GetConditions -obj $condObj
    }

    ExtractLine -obj $obj
    
    $continueKey = $obj.Data.Continue.Cues
    foreach ($con in $continueKey) {
      $conId = $con.Substring(4)
      Log -message "Continue key: ${conId}"

      GetDialogue -Key $conId
    }
    $objData = $obj.Data
    $blueprintType = $objData | Get-Member -MemberType NoteProperty | Where-Object { $_.Name -eq '$type' } | ForEach-Object { $objData.$($_.Name) }

    if ($blueprintType -ne "b6d078a4ae218fe4a82f3fb5707b7e1f, BlueprintBookPage") {
      $answersKey = $obj.Data.Answers
      foreach ($ans in $answersKey) {
        $ansId = $ans.Substring(4)
        Log -message "Answers key: ${ansId}"

        GetAnswerList -Key $ansId
      }
    }

    # if file is a CueSequence
    $cuesKey = $obj.Data.Cues
    foreach ($cues in $cuesKey) {
      $cuesId = $cues.Substring(4)
      Log -message "Cue key (from cue sequence ${Key}): ${cuesId}"

      GetDialogue -Key $cuesId
    }

    $exitKey = $obj.Data.m_Exit
    if ($null -ne $exitKey -and $exitKey.Length -gt 0) {
      $exitId = $exitKey.Substring(4)
      Log -message "Exit sequence cue: ${exitId}"

      GetDialogue -Key $exitId
    }

    if ($blueprintType -eq "b6d078a4ae218fe4a82f3fb5707b7e1f, BlueprintBookPage") {
      $answersKey = $obj.Data.Answers
      foreach ($ans in $answersKey) {
        $ansId = $ans.Substring(4)
        Log -message "Answers key: ${ansId}"

        GetAnswerList -Key $ansId
      }
    }

  }
}

foreach ($cue in $firstCue) {
  $cueId = $cue.Substring(4)
  Log -message "Processing Cue ID: ${cueId}"

  GetDialogue -Key $cueId
}