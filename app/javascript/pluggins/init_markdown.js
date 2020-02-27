import MarkdownIt from 'markdown-it';

const initMarkdown = () => {
  // const textarea = document.querySelector('.editor');
  // const chapter_content = document.querySelector('.hidden').firstElementChild;

  const textarea = document.querySelectorAll('.editor');

  const chapter_content = Array.from(document.querySelectorAll('.hidden'));
  let i = 0;

  if (textarea) {
    textarea.forEach((ta) => {
    const chapter = chapter_content[i].firstElementChild;
    const markdown = new MarkdownIt();

    ta.addEventListener('keyup', (event) => {
      const html = markdown.render(ta.value);
      chapter.value = html;
    });


    // const rmd = translate_markdown.turndown(chapter.value);
    // ta.innerText = rmd;
    i += 2
    })


  // const markdown = new MarkdownIt();
  // if (textarea) {
  // textarea.addEventListener('keyup', (event) => {
  //   const html = markdown.render(textarea.value);
  //   chapter_content.value = html;
  };
};

export { initMarkdown };
