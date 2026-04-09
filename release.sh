git ac "Minor change"

currentTagRaw=$(gh release list -L 1 --json tagName | jq ".[0].tagName")

currentTag=${currentTagRaw//\"/}

currentPatch=$(echo $currentTag | cut -d '.' -f 3)

newPatch=$((currentPatch + 1))

newTag=0.0.$newPatch

echo $newTag

gh release create $newTag -n ""
