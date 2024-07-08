*** Settings ***
Library  AppiumLibrary


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/../demoapp/ApiDemos-debug.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=15}


*** Keywords ***
Open Test Application
  [Arguments]    ${appActivity}=.ApiDemos
  Open Application  http://127.0.0.1:4723  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  appPackage=io.appium.android.apis  appActivity=${appActivity}
#  ...  app=${ANDROID_APP} # to install the app each time
