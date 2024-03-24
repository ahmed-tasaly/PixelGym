GRADLE_PATH="./android/app/build.gradle"
VERSION_PATH="./VERSION_ANDROID"

if [ ! -f "${GRADLE_PATH}" ]; then
  echo "Gradle file not found."
  exit 1
fi

if [ ! -f "${VERSION_PATH}" ]; then
  echo "Version file not found."
  exit 1
fi

updateBuildNumber()
   {
   [[ $1 =~ ([^0-9]*)([0-9]+) ]] || { echo "Invalid input."; exit; }
   echo "${BASH_REMATCH[1]}$(( ${BASH_REMATCH[2]} + 1 ))"
   }

TEMP_GRADLE_PATH=${GRADLE_PATH}.tmp
CURRENT_BUILD_NUMBER=`awk '/versionCode/ {print $2}' $GRADLE_PATH`
NEW_BUILD_NUMBER="$(updateBuildNumber $CURRENT_BUILD_NUMBER)"
NEW_VERSION_NAME=`cat $VERSION_PATH`

cat ${GRADLE_PATH} | sed "s/versionCode .*/versionCode ${NEW_BUILD_NUMBER}/" > ${TEMP_GRADLE_PATH}
cat ${TEMP_GRADLE_PATH} | sed "s/versionName \".*\"/versionName \"${NEW_VERSION_NAME}\"/" > ${GRADLE_PATH}

echo "Gradle updated."

rm -f ${TEMP_GRADLE_PATH}
