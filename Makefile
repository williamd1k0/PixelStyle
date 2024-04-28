VERSION := 0.9.0
APK_OUTPUTS := app/build/outputs/apk
ICONS_TARGET_DIR := app/src/main/res/drawable-nodpi
ICONS_SOURCE_DIR := assets/icons
ICONS_SOURCE := $(wildcard ${ICONS_SOURCE_DIR}/*.png)
ICONS_PNG := $(notdir ${ICONS_SOURCE})
ICONS_TARGETS := $(addprefix ${ICONS_TARGET_DIR}/,${ICONS_PNG})
SHEET_TILES := 8

debug: ${APK_OUTPUTS}/debug/PixelStyle-${VERSION}.apk
release: ${APK_OUTPUTS}/release/PixelStyle-${VERSION}.apk
sheets: assets/dev/all-xxl.png

${ICONS_TARGETS}: ${ICONS_SOURCE}
	@magick $(addprefix ${ICONS_SOURCE_DIR}/,$(notdir $@)) -scale 1200% $@

${APK_OUTPUTS}/debug/PixelStyle-${VERSION}.apk: ${ICONS_TARGETS} app/src/main/res/xml/appfilter.xml
	@./gradlew assembleDebug

${APK_OUTPUTS}/release/PixelStyle-${VERSION}.apk: ${ICONS_TARGETS} app/src/main/res/xml/appfilter.xml
	@./gradlew assembleRelease

assets/dev/all.png: ${ICONS_SOURCE}
	@magick montage $^ -tile ${SHEET_TILES}x$(shell calc 'ceil ($(shell echo ${ICONS_SOURCE} | wc -w) / ${SHEET_TILES})' | xargs) -geometry 16x16+0+0 -background none $@

assets/dev/all-xxl.png: assets/dev/all.png
	@magick $< -scale 1200% $@
