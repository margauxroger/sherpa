import TurndownService from 'turndown';


const initTranslateMarkdown = () => {
  const modal = document.querySelector('.modal');
  const textarea = document.querySelectorAll('.editor');

  const chapter_content = Array.from(document.querySelectorAll('.hidden'));
  let i = 0;

  if (modal && textarea) {
    textarea.forEach((ta) => {
    const chapter = chapter_content[i].firstElementChild;
    console.log(chapter)
    const translate_markdown = new TurndownService({ headingStyle: 'atx', emDelimiter: '*'});
    const rmd = translate_markdown.turndown(chapter.value);
    ta.innerText = rmd;
    i += 2
    })
  }

};


export { initTranslateMarkdown };
