
const { parse } = require('node-html-parser');

const JFile = require("jfile")


let urlParser=($, version) =>
$(`[href="/gitea/tea/releases/tag/${version}"]`)
  .parent().parent()
    .find(`strong:contains("tea-${version}-linux-amd64"):eq(0)`)
      .parent().attr('href')

const page = new JFile("page.html")

const root = parse(page.text);
console.log(root.querySelectorAll('strong')[23].parentElement.getAttribute('href'))