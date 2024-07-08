*** Settings ***
Library     AppiumLibrary
Library     ../lib/AppiumHelper.py


*** Keywords ***
Do swipe
    [Arguments]    ${locator}     ${direction}      ${offset}=80
    IF  ('${direction}' == 'left' or '${direction}' == 'right')
        ${axis}     Set Variable    horizontal
    ELSE
        ${axis}     Set Variable    vertical
    END
    ${rect}     Get Element Rect    ${locator}
    ${start-point}    Calculate Start Point    ${rect}      ${direction}    ${axis}     ${offset}
    ${end-point}    Calculate End Point    ${rect}      ${direction}    ${axis}     ${offset}
    ${platform}     Get Capability      platformName
    IF  '${platform}' != 'Android'
        ${end-point}    Calculate End Offset    ${start-point}      ${end-point}
    END
    Swipe    ${start-point}[x]   ${start-point}[y]    ${end-point}[x]  ${end-point}[y]


Do swipe script
    [Arguments]    ${locator}     ${direction}
    &{scrollGesture}	create dictionary   elementId=${locator}      direction=${direction}      percent=1   speed=3000
    Execute Script      mobile: swipeGesture   &{scrollGesture}
