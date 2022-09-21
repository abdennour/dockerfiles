// Importing the jsdom module
const JFile = require("jfile")
const jsdom = require("jsdom");

let urlParser=($, version) =>
$(`[href="/gitea/tea/releases/tag/${version}"]`)
  .parent().parent()
    .find(`strong:contains("tea-${version}-linux-amd64"):eq(0)`)
      .parent().attr('href')

// urlParser =($, version) => $(`[href="/gitea/tea/releases/tag/${version}"]`).html()
const page = new JFile("page.html")

// Creating a window with a document
const dom = new jsdom.JSDOM(page.text);
  
// Importing the jquery and providing it
// with the window
const jquery = require("jquery")(dom.window);
  
// Appending a paragraph tag to the body
// jquery("body").append("<p>Is a cool Website</p>");
  
// Getting the content of the body
// const content = dom.window.document.querySelector("body");

// Printing the content of the heading and paragraph
console.log(urlParser(jquery, process.env.GITEA_CLI_VERSION));
console.log(jquery(`[href="/gitea/tea/releases/tag/${process.env.GITEA_CLI_VERSION}"]`).text())