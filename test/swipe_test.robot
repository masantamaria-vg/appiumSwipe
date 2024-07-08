*** Settings ***
Documentation  Swipe gesture PoC
Library  AppiumLibrary
Library  Dialogs
Resource  ../resources/resource.robot
Resource  ../resources/swipes.robot
Test Teardown  Close Application


*** Test Cases ***
Should perform a horizontal swipe Script
    [Tags]    horizontal    script
    Open Test Application
    Click Element   accessibility_id=Views
    Click Element   accessibility_id=Gallery
    Click Element   accessibility_id=1. Photos
    Wait until element is visible    id=io.appium.android.apis:id/gallery
    ${photo-gallery}    Get Webelement      id=io.appium.android.apis:id/gallery
    Do swipe script     ${photo-gallery}     left
    Pause Execution     Next swipe to the left
    Do swipe script     ${photo-gallery}     left
    Pause Execution     Next swipe to the right
    Do swipe script     ${photo-gallery}     right
    Pause Execution     End

Should perform a horizontal swipe
    [Tags]    horizontal
    Open Test Application
    Click Element   accessibility_id=Views
    Click Element   accessibility_id=Gallery
    Click Element   accessibility_id=1. Photos
    Wait until element is visible    id=io.appium.android.apis:id/gallery
    ${photo-gallery}    Get Webelement      id=io.appium.android.apis:id/gallery
    Do swipe     ${photo-gallery}     left
    Pause Execution     Next swipe to the left
    Do swipe     ${photo-gallery}     left
    Pause Execution     Next swipe to the right
    Do swipe     ${photo-gallery}     right
    Pause Execution     End

Should perform a vertical swipe
    [Tags]    vertical
    Open Test Application
    Click Element   accessibility_id=Views
    Wait until element is visible    id=android:id/list
    ${entry-list}    Get Webelement      id=android:id/list
    Do swipe    ${entry-list}     up
    Pause Execution     Next swipe up
    Do swipe    ${entry-list}     up
    Pause Execution     Next swipe down
    Do swipe    ${entry-list}     down    350
    Pause Execution     End
