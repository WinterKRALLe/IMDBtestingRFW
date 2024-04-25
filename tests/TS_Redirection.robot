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
TC_1: Verify Homepage URL
    • Verify if the page is the home page.

    1. Load the current URL.
    2. The loaded URL should match the set URL.

TC_2: Logo Redirection
    • Check if the logo redirects to the home page.

    1. Click on the logo element.
    2. Verify if the URL contains the word 'home'.

TC_3: Span Link
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

TC_4: Heading Link
    • The page should redirect to the home page and
    be able to repeat the previous process.

    1. Click on the logo element.
    2. Give it some time after the load.
    3. Use a JS command to scroll down the page.
    4. Give it some time to be scrolled.
    5. The page should contain the specific heading
    element.
    6. Click on the heading element.
    7. Verify if the URL contains the word 'top-picks'.

TC_5: Menu Link
    • The page should be able to open the menu
    and contain clickable links.

    1. Run the keyword 'Open Menu'.
    2. Click on a link with the text
    'Browse Movies by Genre'.
    3. Verify if the URL contains the word 'genre'.

# TC_6: Image Link
#     • Now the page should be on Genres.
#     • Clicking on an image element should redirect to
#     a specific page.

#     1. Click on the image element.
#     2. Verify if the page contains the text
#     'Top 50 Crime Movies and TV Shows'.

# TC_7: Icon Link
#     • Now the page should contain a list of 50 movies.
#     • Every movie has a title, an image, rating, and
#     clickable icon 'Add to Watchlist'.

#     1. Wait until the page contains the first clickable icon.
#     2. Give it some time to load.
#     3. Click on the element.
#     4. The user is not logged in, so it redirects to
#     the signin page that should contain the title 'Sign in'.
#     5. Verify if the URL contains the word 'signin'.
________________________________________________________
Post-conditions:
    Close the browser.
________________________________________________________


*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/Inputs.robot
Resource    ../variables/HomepageElements.robot
Resource    ../keywords/Keywords.robot


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
    Wait Until Page Contains Element    //span[normalize-space()='Get more recommendations']
    Execute Javascript    window.scrollBy(0, 1000)
    Sleep    .2
    Click Element    //span[normalize-space()='Get more recommendations']
    Location Should Contain    what-to-watch

TC_4 Heading Link
    Click Element    //a[@id='home_img_holder']
    Sleep    .2
    Execute Javascript    window.scrollBy(0, 1000)
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
