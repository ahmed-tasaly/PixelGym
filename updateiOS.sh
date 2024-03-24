PROJECT_FILE="./ios/PixelGym.xcodeproj/project.pbxproj"
VERSION_PATH="./VERSION_IOS"

if [ ! -f "${PROJECT_FILE}" ]; then
  echo "Project file not found."
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

TEMP_PROJECT_FILE=${PROJECT_FILE}.tmp
CURRENT_BUILD_NUMBER=`awk '/CURRENT_PROJECT_VERSION/ {print $3}' $PROJECT_FILE`
NEW_BUILD_NUMBER="$(updateBuildNumber $CURRENT_BUILD_NUMBER)"
NEW_VERSION_NAME=`cat $VERSION_PATH`

cat ${PROJECT_FILE} | sed "s/CURRENT_PROJECT_VERSION = .*/CURRENT_PROJECT_VERSION = ${NEW_BUILD_NUMBER};/" > ${TEMP_PROJECT_FILE}
cat ${TEMP_PROJECT_FILE} | sed "s/MARKETING_VERSION = .*/MARKETING_VERSION = ${NEW_VERSION_NAME};/" > ${PROJECT_FILE}

echo "Project file updated."

rm -f ${TEMP_PROJECT_FILE}
