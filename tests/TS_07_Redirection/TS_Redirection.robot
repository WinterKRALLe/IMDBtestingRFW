*** Comments ***
________________________________________________________

    Manual Test Cases
________________________________________________________
Keywords:
    • Open Browser Clickout Cookies
    • Open Menu
    • Close Menu
________________________________________________________
Pre-conditions:
    Call the Open Browser Clickout Cookies keyword
________________________________________________________
TC_1 Verify Homepage URL
    • Verify if the page is the home page.

    1. Load the current URL.
    2. The loaded URL should match the set URL.

TC_2 Logo Redirection
    • Check if the logo redirects to the home page.

    1. Click on the logo element.
    2. Verify if the URL contains the word 'home'.

TC_3 Span Link
    • Check if a specific span element can redirect
    to a page with the title 'What to watch'.

    1. Wait until the page loads the specific span
    element.
    2. Because it is not optically visible and not
    clickable, it needs to be scrolled down using
    a JS command.
    3. The page has to wait until it is scrolled,
    put it to sleep.
    4. Click on the span element.
    5. Verify if the URL contains the word 'what-to-watch'.

TC_4 Heading Link
    • The page should redirect to the home page and
    be able to repeat the previous process.

    1. Click on the logo element.
    2. Give it some time after the load.
    3. Use a JS command to scroll down the page.
    4. Give it some time to be scrolled.
    5. The page should contain the specific heading element.
    6. Click on the heading element.
    7. Verify if the URL contains the word 'top-picks'.

TC_5 Menu Link
    • The page should be able to open the menu
    and contain clickable links.

    1. Run the keyword 'Open Menu'.
    2. Click on a link with the text 'Browse Movies by Genre'.
    3. Verify if the URL contains the word 'genre'.

TC_6 Search Bar Redirection
    • Verify that the search bar redirects correctly.

    1. Enter a valid search query (e.g., “The Shawshank Redemption”) into the search bar.
    2. Click the search button.
    3. Confirm that the search results page loads.

TC_7 Footer Links
    • Test footer links (e.g., “About,” “Contact Us,” “Privacy Policy”).

    1. Click on a footer link (e.g., “About IMDb”).
    2. Verify that the corresponding page opens.
    3. Check if the URL matches the expected path.

TC_8 User Profile Redirection
    • Confirm that user profiles redirect correctly.

    1. Log in to access your user profile.
    2. Click on your profile picture or username.
    3. Verify that your profile page opens.
    4. Check if the URL contains your username.

TC_9 External Links
    • Test external links (e.g., social media icons, IMDb Pro).

    1. Click on an external link (e.g., IMDb’s Twitter handle).
    2. Verify that the external page opens in a new tab.
    3. Check if the URL corresponds to the expected social media profile.

TC_10 Error Page Redirection
    • Validate redirection to error pages (e.g., 404 Not Found).

    1. Manually enter an invalid URL (e.g., https://www.imdb.com/invalid-page).
    2. Verify that the error page loads.
    3. Check if the URL contains relevant error codes (e.g., “404”).

________________________________________________________
Post-conditions:
    Close the browser.
________________________________________________________


*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library    SeleniumLibrary
Library    SeleniumLibrary
Resource    ../../variables/Browser.robot
Resource    ../../variables/URLs.robot
Resource    ../../variables/Inputs.robot
Resource    ../../variables/HomepageElements.robot
Resource    ../../keywords/Keywords.robot


*** Test Cases ***
Pre-conditions
    Open Browser Clickout Cookies

TC_1 Verify Homepage URL
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${URL}

TC_2 Logo Redirection
    Click Element    //a[@id='home_img_holder']
    Location Should Contain    home

TC_3 Span Link
    Execute Javascript    window.scrollBy(0, 500)
    Sleep    .2
    Click Element    //a[contains(@class, 'ipc-btn') and contains(@href, '/what-to-watch')]

    Location Should Contain    what-to-watch

TC_4 Heading Link
    Execute Javascript    window.scrollBy(0, 0)
    Sleep    .5s
    Click Element    ${LinkToHome}
    Sleep    .2
    Execute Javascript    window.scrollBy(0, 500)
    Sleep    .2
    Wait Until Page Contains Element    //h3[normalize-space()='Top picks']
    Click Element    //h3[normalize-space()='Top picks']
    Location Should Contain    top-picks

TC_5 Menu Link
    Open Menu
    Click Element    //span[normalize-space()='Browse Movies by Genre']
    Location Should Contain    genre


Post-conditions
    Close Browser
